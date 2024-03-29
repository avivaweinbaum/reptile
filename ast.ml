(* AST for Reptile *)
(* Aviva Weinbaum, Lindsey Weiskopf, Hariti Patel, Aileen Cano *)

type operator = Add | Sub | Mul | Div | Equal | Neq | Less | Greater | Geq | Leq |
          And | Or

type unoperator = Not | Neg

type typ = Int | String | Void | Bool | Float | Rgb | Canvas | Pointer

type bind = typ * string

type expr =
    Binop of expr * operator * expr
  | Unop of unoperator * expr
  | Literal of int
  | Fliteral of string
  | Sliteral of string
  | BoolLit of bool
  | Id of string
  | Call of string * expr list
  | Assign of string * expr
  | Noexpr

type stmt =
    Expr of expr
  | Block of stmt list
  | Return of expr
  | If of expr * stmt * stmt
  | Var of typ * string
  | VarAssign of typ * string * expr
  | While of expr * stmt

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

let string_of_typ = function
  Int -> "int"
| Bool -> "bool"
| Void -> "void"
| Float -> "float"
| String -> "string"
| Rgb -> "Rgb"
| Canvas -> "Canvas"
| Pointer -> "Pointer"

let string_of_uop = function
  Neg -> "-"
| Not -> "!"

let rec string_of_expr = function
  Literal(l) -> string_of_int l
| Fliteral(f) -> f
| Sliteral(s) -> s
| Id(s) -> s
| Binop(e1, o, e2) ->
  string_of_expr e1 ^ " " ^ string_of_op o ^ " " ^ string_of_expr e2
| Unop(o, e) -> string_of_uop o ^ string_of_expr e
| BoolLit(true) -> "true"
| BoolLit(false) -> "false"
| Call(f, el) ->
  f ^ "(" ^ String.concat ", " (List.map string_of_expr el) ^ ")"
| Assign(v, e) -> v ^ " = " ^ string_of_expr e
| Noexpr -> ""

let rec string_of_stmt = function
Block(stmts) ->
  "{\n" ^ String.concat "" (List.map string_of_stmt stmts) ^ "}\n"
| Expr(expr) -> string_of_expr expr ^ ";\n";
| Var(typ, var) -> string_of_typ typ ^ " " ^ var ^ "\n"
| VarAssign(typ, var, ex) -> string_of_typ typ ^ " " ^ var ^ " = " ^ string_of_expr ex ^ "\n"
| Return(expr) -> "return " ^ string_of_expr expr ^ ";\n"
| While(expr, stmt) -> "while (" ^ string_of_expr expr ^ ") " ^ string_of_stmt stmt ^ "\n"
| If(e, s, Block([])) -> "if (" ^ string_of_expr e ^ ")\n" ^ string_of_stmt s
| If(e, s1, s2) ->  "if (" ^ string_of_expr e ^ ")\n" ^
      string_of_stmt s1 ^ "else\n" ^ string_of_stmt s2

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
