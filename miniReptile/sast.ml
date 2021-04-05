(* SAST for Reptile *)
(* Aviva Weinbaum, Lindsey Weiskopf, Hariti Patel, Aileen Cano *)

open Ast

type sexpr = typ * sx
and sx =
    SBinop of sexpr * operator * sexpr
  | SUnop of unoperator * sexpr
  | SLiteral of int
  | SBoolLit of bool
  | SFliteral of string
  | SId of string
  | SString of string
  | SCall of string * sexpr list
  | SAssign of string * sexpr
  (* | SListAccess of string * sexpr
  | SListLit of sexpr list *)
  | SNoexpr

type sstmt = 
    SExpr of sexpr
  | SBlock of sstmt list
  | SReturn of sexpr
  | SIf of sexpr * sstmt * sstmt
  | SVar of typ * string
  | SVarAssign of typ * string * sexpr

type sfunc_decl = {
    styp : typ;
    sfname : string;
    sformals : bind list;
    sbody : sstmt list;
  }

  type sprogram = bind list * sfunc_decl list


(* Pretty-printing functions *)

let rec string_of_sexpr (t, e) =
  "(" ^ string_of_typ t ^ " : " ^ (match e with
    SLiteral(l) -> string_of_int l
  | SFliteral(f) -> f
  | SId(s) -> s
  | SBinop(e1, o, e2) ->
      string_of_sexpr e1 ^ " " ^ string_of_op o ^ " " ^ string_of_sexpr e2
  | SUnop(o, e) -> string_of_uop o ^ string_of_sexpr e
  | SCall(f, el) ->
      f ^ "(" ^ String.concat ", " (List.map string_of_sexpr el) ^ ")"
  (* | SListAccess(arr, index) -> 
    arr ^ "[" ^ string_of_sexpr index ^ "]"
  | SListLit(args) -> "[" ^ (List.map string_of_sexpr args) ^ "]" *)
  | SNoexpr -> ""
				  ) ^ ")"				     

let rec string_of_sstmt = function
    SBlock(stmts) ->
      "{\n" ^ String.concat "" (List.map string_of_sstmt stmts) ^ "}\n"
  | SExpr(expr) -> string_of_sexpr expr ^ ";\n";
  | SVar(typ, var) -> string_of_typ typ ^ " " ^ var ^ "\n"
  | SVarAssign(typ, var, ex) -> string_of_typ typ ^ " " ^ var ^ " = " ^ string_of_sexpr ex ^ "\n"
  | SReturn(expr) -> "return " ^ string_of_sexpr expr ^ ";\n"
  | SIf(e, s, SBlock([])) ->
      "if (" ^ string_of_sexpr e ^ ")\n" ^ string_of_sstmt s
  | SIf(e, s1, s2) ->  "if (" ^ string_of_sexpr e ^ ")\n" ^
      string_of_sstmt s1 ^ "else\n" ^ string_of_sstmt s2

let string_of_sfdecl fdecl =
  string_of_typ fdecl.styp ^ " " ^
  fdecl.sfname ^ "(" ^ String.concat ", " (List.map snd fdecl.sformals) ^
  ")\n{\n" ^
  String.concat "" (List.map string_of_sstmt fdecl.sbody) ^
  "}\n"

  let string_of_sprogram (vars, funcs) =
    String.concat "" (List.map string_of_vdecl vars) ^ "\n" ^
    String.concat "\n" (List.map string_of_sfdecl funcs)
