(* AST for Reptile *)
(* Aviva Weinbaum, Lindsey Weiskopf, Hariti Patel, Aileen Cano *)

type operator = Add | Sub | Mul | Div | Equal | Neq | Less | Greater | Geq | Leq | 
          And | Or | Exp | Mod

type unoperator = Not | Neg
type incoperator = Incr | Decr

type typ = Int | String | Void | Bool

type bind = typ * string

type expr =
    Binop of expr * operator * expr
  | Unop of unoperator * expr
  | Inc of expr * incoperator
  | Literal of int
  | BoolLit of bool
  | Id of string
  | String of string
  | Call of string * expr list
  | Noexpr

type stmt = 
    Expr of expr
  | Block of stmt list

type func_decl = {
  typ : typ;
  fname : string;
  formals : bind list;
  body : stmt list;
}

type program = bind list * func_decl list


(* Pretty-printing functions *)

let string_of_op = function
Add -> "+"
| Sub -> "-"
| Mul -> "*"
| Div -> "/"
| Equal -> "=="
| Neq -> "!="
| Less -> "<"
| Leq -> "<="
| Greater -> ">"
| Geq -> ">="
| And -> "&&"
| Or -> "||"

let string_of_uop = function
Neg -> "-"
| Not -> "!"

let rec string_of_expr = function
  Literal(l) -> string_of_int l
| BoolLit(true) -> "true"
| BoolLit(false) -> "false"
| Id(s) -> s
| Binop(e1, o, e2) ->
  string_of_expr e1 ^ " " ^ string_of_op o ^ " " ^ string_of_expr e2
| Unop(o, e) -> string_of_uop o ^ string_of_expr e
| Call(f, el) ->
  f ^ "(" ^ String.concat ", " (List.map string_of_expr el) ^ ")"
| Noexpr -> ""

let rec string_of_stmt = function
Block(stmts) ->
  "{\n" ^ String.concat "" (List.map string_of_stmt stmts) ^ "}\n"
| Expr(expr) -> string_of_expr expr ^ ";\n"
(* | Return(expr) -> "return " ^ string_of_expr expr ^ ";\n"; *)

let string_of_typ = function
  Int -> "int"
| Bool -> "bool"
| Void -> "void"

let string_of_vdecl (t, id) = string_of_typ t ^ " " ^ id ^ ";\n"

let string_of_fdecl fdecl =
string_of_typ fdecl.typ ^ " " ^
fdecl.fname ^ "(" ^ String.concat ", " (List.map snd fdecl.formals) ^
")\n{\n" ^
String.concat "" (List.map string_of_stmt fdecl.body) ^
"}\n"

let string_of_program (vars, funcs) =
  String.concat "" (List.map string_of_vdecl vars) ^ "\n" ^
  String.concat "\n" (List.map string_of_fdecl funcs)
