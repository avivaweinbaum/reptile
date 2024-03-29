(* Semantic checking for the Reptile compiler *)
(* Aviva Weinbaum, Lindsey Weiskopf, Hariti Patel, Aileen Cano *)

open Ast
open Sast

module StringMap = Map.Make(String)

(* Semantic checking of the AST. Returns an SAST if successful,
   throws an exception if something is wrong.

   Check each global variable, then check each function *)

let check (globals, functions) =

  (* Verify a list of bindings has no void types or duplicate names *)
  let check_binds (kind : string) (binds : bind list) =
    let rec dups = function
        [] -> ()
      |	((_,n1) :: (_,n2) :: _) when n1 = n2 ->
	  raise (Failure ("duplicate " ^ kind ^ " " ^ n1))
      | _ :: t -> dups t
    in dups (List.sort (fun (_,a) (_,b) -> compare a b) binds)
  in

  (**** Check global variables ****)

  check_binds "global" globals;

  (**** Check functions ****)

  (* Collect function declarations for built-in functions: no bodies *)
  let built_in_decls = 
    let add_bind map (name, rety, tys) = StringMap.add name {
      typ = rety;
      fname = name; 
      formals = tys;
      body = [] } map
    in List.fold_left add_bind StringMap.empty [ ("print", Void, [(Int, "x")]);
      ("Rgb", Rgb, [(Int, "r"); (Int, "g"); (Int, "b")]);
      ("Pointer", Pointer, [(Int, "x"); (Int, "y"); (Rgb, "color"); (Float, "angle")]);
      ("Canvas", Canvas, [(Int, "x"); (Int, "y")]);
      ("save", Void, [(Canvas, "can"); (String, "filename")]); 
      ("pixel", Canvas, [(Canvas, "can"); (Rgb, "color"); (Int, "x"); (Int, "y")]);
      ("get_rgb_r", Int, [(Rgb, "rgb");]);
      ("get_rgb_g", Int, [(Rgb, "rgb");]);
      ("get_rgb_b", Int, [(Rgb, "rgb");]);
      ("get_pointer_x", Int, [(Pointer, "pointer")]);
      ("get_pointer_y", Int, [(Pointer, "pointer")]);
      ("set_pointer_color", Pointer, [(Pointer, "pointer"); (Rgb, "rgb")]);
      ("get_canvas_x", Int, [(Canvas, "canvas")]);
      ("get_canvas_y", Int, [(Canvas, "canvas")]);
      ("sine", Float, [(Float, "angle");]);
      ("cosine", Float, [(Float, "angle");]);
      ("tangent", Float, [(Float, "angle");]);
      ("mod", Int, [(Int, "val1"); (Int, "val2");]);
      ("floors", Int, [(Float, "val");]);
      ("getRise", Int, [(Int, "distance"); (Float, "angle");]);
      ("getRun", Int, [(Int, "distance"); (Float, "angle");])
      ];
  in

  (* Add function name to symbol table *)
  let add_func map fd = 
    let built_in_err = "function " ^ fd.fname ^ " may not be defined"
    and dup_err = "duplicate function " ^ fd.fname
    and make_err er = raise (Failure er)
    and n = fd.fname (* Name of the function *)
    in match fd with (* No duplicate functions or redefinitions of built-ins *)
         _ when StringMap.mem n built_in_decls -> make_err built_in_err
       | _ when StringMap.mem n map -> make_err dup_err  
       | _ ->  StringMap.add n fd map 
  in

  (* Collect all function names into one symbol table *)
  let function_decls = List.fold_left add_func built_in_decls functions
  in
  
  (* Return a function from our symbol table *)
  let find_func s = 
    try StringMap.find s function_decls
    with Not_found -> raise (Failure ("unrecognized function " ^ s))
  in

  let _ = find_func "main" in (* Ensure "main" is defined *)

  let check_function func =
    (* Make sure no formals or locals are void or duplicates *)
    check_binds "formal" func.formals;

    (* Raise an exception if the given rvalue type cannot be assigned to
       the given lvalue type *)
    let check_assign lvaluet rvaluet err =
       if lvaluet = rvaluet then lvaluet else raise (Failure err)
    in   

    (* Build local symbol table of variables for this function *)
    let symbols = List.fold_left (fun m (ty, name) -> StringMap.add name ty m)
	                StringMap.empty (globals @ func.formals )
    in

    (* Return a variable from our local symbol table *)
    let type_of_identifier locals s =
      try StringMap.find s locals
      with Not_found -> raise (Failure ("undeclared identifier " ^ s))
    in

    (* Return a semantically-checked expression, i.e., with a type *)
    let rec expr locals = function
        Literal  l -> (Int, SLiteral l)
      | Fliteral f -> (Float, SFliteral f)
      | Sliteral s -> (String, SSliteral s)
      | BoolLit  l -> (Bool, SBoolLit l)
      | Noexpr     -> (Void, SNoexpr)
      | Id s       -> (type_of_identifier locals s, SId s)
      | Unop(op, e) -> 
          let (t, e') = expr locals e in
          let ty = match op with
            Neg when t = Int -> t
          | Not when t = Bool -> Bool
          | _ -> raise (Failure ("illegal unary operator"))
          in (ty, SUnop(op, (t, e')))
      | Binop(e1, op, e2) -> 
          let (t1, e1') = expr locals e1 
          and (t2, e2') = expr locals e2 in
          (* All binary operators require operands of the same type *)
          let same = t1 = t2 in
          (* Determine expression type based on operator and operand types *)
          let ty = match op with
            Add | Sub | Mul | Div when same && t1 = Int   -> Int
          | Add | Sub | Mul | Div when same && t1 = Float -> Float
          | Equal | Neq            when same               -> Bool
          | Less | Leq | Greater | Geq
                     when same && ((t1 = Int) || (t1 = Float)) -> Bool
          | And | Or when same && t1 = Bool -> Bool
          | _ -> raise (
	      Failure ("illegal binary operator "))
          in (ty, SBinop((t1, e1'), op, (t2, e2')))
      | Call(fname, args) -> 
          let fd = find_func fname in
          let param_length = List.length fd.formals in
          if List.length args != param_length then
            raise (Failure ("calling failure"))
          else let check_call (ft, _) e = 
            let (et, e') = expr locals e in 
            let err = "illegal argument found" ^ string_of_typ et ^
              " expected " ^ string_of_typ ft ^ " in " ^ string_of_expr e
            in (check_assign ft et err, e')
          in 
          let args' = List.map2 check_call fd.formals args
          in (fd.typ, SCall(fname, args'))
      | Assign(var, e) as ex -> 
          let lt = type_of_identifier locals var
          and (rt, e') = expr locals e in
          let err = "illegal assignment " ^ string_of_typ lt ^ " = " ^ 
            string_of_typ rt ^ " in " ^ string_of_expr ex
          in (check_assign lt rt err, SAssign(var, (rt, e')))
    in

    let check_bool_expr locals e = 
      let (t', e') = expr locals e
      and err = "expected Boolean expression in " ^ string_of_expr e
      in if t' != Bool then raise (Failure err) else (t', e') 
    in

    (* Return a semantically-checked statement i.e. containing sexprs *)
    let rec check_stmt locals = function
        Expr e -> SExpr (expr locals e)
      | If(p, b1, b2) -> SIf(check_bool_expr locals p, check_stmt locals b1, check_stmt locals b2)
      | Return e -> let (t, e') = expr locals e in
        if t = func.typ then SReturn (t, e') 
        else raise (Failure ("return failure")) 
	    
	    (* A block is correct if each statement is correct and nothing
	       follows any Return statement.  Nested blocks are flattened. *)
      | Block sl -> 
          let rec check_stmt_list block_locals ssl = function
              [Return _ as s] -> [check_stmt block_locals s]
            | Return _ :: _   -> raise (Failure "nothing may follow a return")
            | Block sl :: ss -> [check_stmt block_locals (Block sl)] 
                              @ (check_stmt_list block_locals ssl ss)
            | s :: ss ->
              (match s with 
                Var(t,name) -> 
                  (match t with
											Void -> raise(Failure ("illegal void local "^name))
										| _ -> let block_locals = StringMap.add name t block_locals
                           in [check_stmt block_locals s] @ check_stmt_list block_locals ssl ss)
              | VarAssign(t,name,e) ->
								if t == Void then raise(Failure ("illegal void local "^name) )
								else
                let sx = expr block_locals e in
                let typ = (if fst(sx) == t
                          then fst(sx) 
                          else raise(Failure("illegal assignment"))) in
                let block_locals = StringMap.add name typ block_locals in
                  [check_stmt block_locals s] @ check_stmt_list block_locals ssl ss
              | _ -> [check_stmt block_locals s] @ check_stmt_list block_locals ssl ss)
            | []              -> ssl
          in SBlock(check_stmt_list locals [] sl)
      | Var (ty,id) -> SVar(ty,id)
      | VarAssign(_,s,e) -> 
        let sx = expr locals e in
        let ty = type_of_identifier locals s in 
        SVarAssign(ty,s,sx)
      | While(e, s) -> SWhile(check_bool_expr locals e, check_stmt locals s)
      in
    { styp = func.typ;
      sfname = func.fname;
      sformals = func.formals;
      sbody = match check_stmt symbols (Block func.body) with
        SBlock(sl) -> sl
      | _ -> raise (Failure ("internal error: block didn't become a block"))
    }
  in (globals, List.map check_function functions)
