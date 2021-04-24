module L = Llvm
module A = Ast
open Sast

module StringMap = Map.Make(String)

(* translate : Sast.program -> Llvm.module *)
let translate (globals, functions) =
  let context    = L.global_context () in

  (* Create the LLVM compilation module into which
     we will generate code *)
  let the_module = L.create_module context "Reptile" in

  (* Get types from the context *)
  let i32_t      = L.i32_type    context
  and i8_t       = L.i8_type     context
  and i1_t       = L.i1_type     context
  and void_t     = L.void_type   context
  and float_t    = L.double_type context
  and string_t   = L.pointer_type (L.i8_type context) in
  let rgb_t      = L.pointer_type(L.struct_type context [| i32_t ; i32_t; i32_t |]) in
  let pointer_t  = L.pointer_type(L.struct_type context [| i32_t ; i32_t ; rgb_t ; float_t |]) in
  let canvas_t   = L.pointer_type(L.struct_type context [| i32_t ; i32_t |]) in

 (* Return the LLVM type for a Reptile type *)
  let ltype_of_typ = function
      A.Int   -> i32_t
    | A.Bool  -> i1_t
    | A.Void  -> void_t
    | A.Float -> float_t
    | A.String -> string_t
    | A.Rgb -> rgb_t
    | A.Pointer -> pointer_t
    | A.Canvas -> canvas_t
  in

  let global_vars : L.llvalue StringMap.t =
    let global_var m (t, n) =
      let init = match t with
          A.Float -> L.const_float (ltype_of_typ t) 0.0
        | _ -> L.const_int (ltype_of_typ t) 0
      in StringMap.add n (L.define_global n init the_module) m in
    List.fold_left global_var StringMap.empty globals in

  let printf_t : L.lltype =
      L.var_arg_function_type i32_t [| L.pointer_type i8_t |] in
  let printf_func : L.llvalue =
      L.declare_function "printf" printf_t the_module in

  (* let rgbcons_t : L.lltype =
      L.function_type rgb_t [| i32_t ; i32_t; i32_t |] in
  let rgbcons_fun : L.llvalue =
      L.declare_function "Rgb" rgbcons_t the_module in *)

  let getR_rgb_cons_t : L.lltype =
      L.function_type i32_t [| rgb_t;|] in
  let getR_rgb_cons_fun : L.llvalue =
      L.declare_function "getR_rgb" getR_rgb_cons_t the_module in

  let setR_rgb_cons_t : L.lltype =
      L.function_type rgb_t [| rgb_t; i32_t;|] in
  let setR_rgb_cons_fun : L.llvalue =
      L.declare_function "setR_rgb" setR_rgb_cons_t the_module in

  let ptrcons_t : L.lltype =
      L.function_type pointer_t [| i32_t ; i32_t ; rgb_t ; float_t |] in
  let ptrcons_fun : L.llvalue =
      L.declare_function "Pointer" ptrcons_t the_module in

  let canvascons_t : L.lltype =
      L.function_type canvas_t  [| i32_t ; i32_t |]  in
  let canvascons_fun : L.llvalue =
      L.declare_function "Canvas" canvascons_t the_module in

  (* let createcons_t : L.lltype =
      L.function_type i32_t  [| canvas_t |] in
  let createcons_fun : L.llvalue =
      L.declare_function "create" createcons_t the_module in *)

  let savecons_t : L.lltype =
      L.function_type i32_t  [| canvas_t ; string_t |] in
  let savecons_fun : L.llvalue =
      L.declare_function "save" savecons_t the_module in

  let pixelcons_t : L.lltype =
      L.function_type canvas_t  [| canvas_t ; rgb_t; i32_t ; i32_t |] in
  let pixelcons_fun : L.llvalue =
      L.declare_function "pixel" pixelcons_t the_module in

 (* Define each function (arguments and return type) so we can
     call it even before we've created its body *)
  let function_decls : (L.llvalue * sfunc_decl) StringMap.t =
    let function_decl m fdecl =
      let name = fdecl.sfname
      and formal_types =
        Array.of_list (List.map (fun (t,_) -> ltype_of_typ t) fdecl.sformals)
      in let ftype = L.function_type (ltype_of_typ fdecl.styp) formal_types in
      StringMap.add name (L.define_function name ftype the_module, fdecl) m in
    List.fold_left function_decl StringMap.empty functions in

  (* Fill in the body of the given function *)
  let build_function_body fdecl =
    let (the_function, _) = StringMap.find fdecl.sfname function_decls in
    let builder = L.builder_at_end context (L.entry_block the_function) in

    let int_format_str = L.build_global_stringptr "%d\n" "fmt" builder in
    (* and float_format_str = L.build_global_stringptr "%g\n" "fmt" builder *)
    (* and str_format_str = L.build_global_stringptr "%s\n" "fmt" builder in *)

    let local_vars =
      let add_formal m (t, n) p =
        L.set_value_name n p;
        let local = L.build_alloca (ltype_of_typ t) n builder in
        ignore (L.build_store p local builder);
         StringMap.add n local m
      in
    List.fold_left2 add_formal StringMap.empty fdecl.sformals
      (Array.to_list (L.params the_function)) in

    let lookup n locals = try StringMap.find n locals
                   with Not_found -> StringMap.find n global_vars
    in

    let mem_to_ind ty = match ty  with
    _ -> List.fold_left (fun m (name, ind) -> StringMap.add name ind m)
                StringMap.empty [("r",0); ("g",1); ("b",2); ("x",0); ("y",1); 
                ("color",2); ("angle",3); ("canvas",1)]
    in


    (* Construct code for an expression; return its value *)
    let rec expr builder locals ((_, e) : sexpr) = match e with
        SLiteral i  -> L.const_int i32_t i
      | SFliteral f -> L.const_float_of_string float_t f
      | SSliteral s -> L.build_global_stringptr s "str" builder
      | SBoolLit b  -> L.const_int i1_t (if b then 1 else 0)
      | SNoexpr     -> L.const_int i32_t 0
      | SId s       -> L.build_load (lookup s locals) s builder
      | SAssign (s, e) -> let e' = expr builder locals e in
                          ignore(L.build_store e' (lookup s locals) builder); e'
      | SBinop ((A.Float,_ ) as e1, op, e2) ->
        let e1' = expr builder locals e1
        and e2' = expr builder locals e2 in
        (match op with
          A.Add     -> L.build_fadd
        | A.Sub     -> L.build_fsub
        | A.Mul     -> L.build_fmul
        | A.Div     -> L.build_fdiv
        | A.Equal   -> L.build_fcmp L.Fcmp.Oeq
        | A.Neq     -> L.build_fcmp L.Fcmp.One
        | A.Less    -> L.build_fcmp L.Fcmp.Olt
        | A.Leq     -> L.build_fcmp L.Fcmp.Ole
        | A.Greater -> L.build_fcmp L.Fcmp.Ogt
        | A.Geq     -> L.build_fcmp L.Fcmp.Oge
        | _         -> raise (Failure ("illegal usage of operator " ^
          (A.string_of_op op) ^ " on float"))
        ) e1' e2' "tmp" builder
      | SBinop (e1, op, e2) ->
        let e1' = expr builder locals e1
        and e2' = expr builder locals e2 in
        (match op with
          A.Add     -> L.build_add
        | A.Sub     -> L.build_sub
        | A.Mul     -> L.build_mul
        | A.Div     -> L.build_sdiv
        | A.And     -> L.build_and
        | A.Or      -> L.build_or
        | A.Equal   -> L.build_icmp L.Icmp.Eq
        | A.Neq     -> L.build_icmp L.Icmp.Ne
        | A.Less    -> L.build_icmp L.Icmp.Slt
        | A.Leq     -> L.build_icmp L.Icmp.Sle
        | A.Greater -> L.build_icmp L.Icmp.Sgt
        | A.Geq     -> L.build_icmp L.Icmp.Sge
        (* | _         -> raise (Failure ("illegal binop")) *)
        ) e1' e2' "tmp" builder
      | SUnop(op, ((t, _) as e)) ->
          let e' = expr builder locals e in
          (match op with
              A.Neg when t = A.Float -> L.build_fneg
            | A.Neg                  -> L.build_neg
            | A.Not                  -> L.build_not)
          e' "tmp" builder
      | SCall ("print", [e]) ->
          L.build_call printf_func [| int_format_str ; (expr builder locals e) |]
          "printf" builder
      (* | SCall("Rgb", [r;g;b]) ->
          let r' = expr builder locals r
          and g' = expr builder locals g
          and b' = expr builder locals b in
          L.build_call rgbcons_fun [| r' ; g' ; b' |]
              "Rgb" builder *)
      | SCall ("Rgb", [r;g;b]) ->
          let build_t : L.lltype = 
            L.function_type rgb_t [|i32_t; i32_t; i32_t;|] in 
              let build_func : L.llvalue = 
                L.declare_function "Rgb" build_t the_module in
          L.build_call build_func [| expr builder locals r; expr builder locals g; expr builder locals b; |]
              "Rgb" builder
      | SCall("Pointer", [x;y;color;angle]) ->
          let x' = expr builder locals x
          and y' = expr builder locals y
          and color' = expr builder locals color
          and angle' = expr builder locals angle in
          L.build_call ptrcons_fun [| x' ; y' ; color' ; angle' |]
              "Pointer" builder
      | SCall("Canvas", [x;y]) ->
          let x' = expr builder locals x
          and y' = expr builder locals y in
          L.build_call canvascons_fun [| x' ; y' |]
              "Canvas" builder
      (* | SCall("create", [canvas]) ->
          let canvas' = expr builder locals canvas in
          L.build_call createcons_fun [| canvas' |]
              "create" builder *)
      | SCall("save", [can;filename]) ->
          let can' = expr builder locals can
          and filename' = expr builder locals filename in
          L.build_call savecons_fun [| can' ; filename' |]
              "save" builder
      | SCall("pixel", [can;color;x;y]) ->
        let can' = expr builder locals can
        and color' = expr builder locals color
        and x' = expr builder locals x
        and y' = expr builder locals y in
        L.build_call pixelcons_fun [| can';color';x';y' |]
            "pixel" builder
      | SCall("getR_rgb", [rgb;]) ->
        let rgb' = expr builder locals rgb in
        L.build_call getR_rgb_cons_fun [| rgb' |]
            "getR_rgb" builder
      | SCall("setR_rgb", [rgb; r_new]) ->
        let rgb' = expr builder locals rgb 
        and r_new' = expr builder locals r_new in
        L.build_call setR_rgb_cons_fun [| rgb'; r_new' |]
            "setR_rgb" builder
      | SCall (fname, args) ->
        let (ldev, sfd) = StringMap.find fname function_decls in
        let actuals = List.rev (List.map (fun e -> expr builder locals e)
            (List.rev args)) in
        let ret = (match sfd.styp with
            A.Void -> ""
          | _-> fname^"_ret") in
        L.build_call ldev (Array.of_list actuals) ret builder
      | SAccess(id,sx) ->
          let getI t n = 
            try StringMap.find n (mem_to_ind t) 
            with Not_found -> raise(Failure("member not found"))in
          let getNextVal o t n = L.build_struct_gep o (getI t n) n builder in
          let rec eval out t = function
              SAccess(sid, sf)-> eval (getNextVal out t sid) 
                  (L.type_of(getNextVal out t sid)) (snd sf)  
            | SId sid -> 
                    let ref = L.build_struct_gep out (getI t sid) sid builder in
                    L.build_load ref sid builder
            | SAssign(s,e) -> 
                  let ref = L.build_struct_gep out (getI t s) s builder in
                  let e' =  expr builder locals e in
                  ignore(L.build_store e' ref builder); e'
            | _ -> raise(Failure("invalid field usage"))
          in eval (lookup id locals) (L.type_of (lookup id locals)) (snd sx)
    in

 (* LLVM insists each basic block end with exactly one "terminator"
       instruction that transfers control.  This function runs "instr builder"
       if the current block does not already have a terminator.  Used,
       e.g., to handle the "fall off the end of the function" case. *)
    let add_terminal builder instr =
      match L.block_terminator (L.insertion_block builder) with
        Some _ -> ()
      | None -> ignore (instr builder) in

   (* Build the code for the given statement; return the builder for
       the statement's successor (i.e., the next instruction will be built
       after the one generated by this call) *)

    let rec stmt builder locals = function
        SBlock sl -> List.fold_left (fun (b, lv) s -> stmt b lv s) (builder,locals) sl
      | SVar (ty, id) ->
        let local_var = L.build_alloca (ltype_of_typ ty) id builder in
        let locals = StringMap.add id local_var locals in
        (builder, locals)
      | SVarAssign (ty, id, v) ->
        let local_var = L.build_alloca (ltype_of_typ ty) id builder in
        let locals = StringMap.add id local_var locals in
          ignore (expr builder locals (ty,SAssign(id, v))); (builder, locals)
      | SExpr e -> ignore(expr builder locals e); (builder,locals)
      | SReturn e -> ignore(match fdecl.styp with
                              (* Special "return nothing" instr *)
                              A.Void -> L.build_ret_void builder
                              (* Build return statement *)
                            | _ -> L.build_ret (expr builder locals e) builder );
                     (builder,locals)
      | SWhile (predicate, body) ->
        let pred_bb = L.append_block context "while" the_function in
        ignore(L.build_br pred_bb builder);
        let body_bb = L.append_block context "while_body" the_function in
        add_terminal (fst (stmt (L.builder_at_end context body_bb) locals body))
        (L.build_br pred_bb);
        let pred_builder = L.builder_at_end context pred_bb in
        let bool_val = expr pred_builder locals predicate in
        let merge_bb = L.append_block context "merge" the_function in
        ignore(L.build_cond_br bool_val body_bb merge_bb pred_builder);
        (L.builder_at_end context merge_bb, locals)
      | SIf (predicate, then_stmt, else_stmt) ->
      let bool_val = expr builder locals predicate in
      let merge_bb = L.append_block context "merge" the_function in
      let build_br_merge = L.build_br merge_bb in (* partial function *)
      let then_bb = L.append_block context "then" the_function in
        add_terminal (fst (stmt (L.builder_at_end context then_bb) locals then_stmt))
          build_br_merge;
      let else_bb = L.append_block context "else" the_function in
        add_terminal (fst (stmt (L.builder_at_end context else_bb) locals else_stmt))
          build_br_merge;
      ignore(L.build_cond_br bool_val then_bb else_bb builder);
      (L.builder_at_end context merge_bb, locals)
    in


    (* Build the code for each statement in the function *)
    let (builder,_) = stmt builder local_vars (SBlock fdecl.sbody) in
    (* Add a return if the last block falls off the end *)
      add_terminal builder (match fdecl.styp with
          A.Void -> L.build_ret_void
        | A.Float -> L.build_ret (L.const_float float_t 0.0)
        | t -> L.build_ret (L.const_int (ltype_of_typ t) 0))
in

List.iter build_function_body functions;
the_module