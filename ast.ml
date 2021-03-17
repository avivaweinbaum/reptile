(* AST for Reptile *)
(* Aviva Weinbaum, Lindsey Weiskopf, Hariti Patel, Aileen Cano *)

type operator = Add | Sub | Mul | Div | Equal | Neq | Less | Greater | Geq | 
          And | Or | Exp | Mod

type unoperator = Not | Neg
type incoperator = Incr | Decr

type typ = Int | Bool | Float | Void | String | Rgb of bind list | 
          Canvas of bind list | Pointer of bind list | 
          File of bind list | Array of typ * int

type bind = typ * string

type expr =
    Binop of expr * operator * expr
  | Unop of unoperator * expr
  | Inc of expr * incoperator
  | Literal of int
  | Fliteral of string
  | BoolLit of bool
  | Id of string
  | String of string
  | Assign of string * expr
  | Call of string * expr list
  | ArrayAccess of string * expr
  | ArrayLit of expr list         (* question *)
  | Noexpr

type stmt = 
    Expr of expr
  | Return of expr
  | Block of stmt list
  | If of expr * stmt * stmt
  | For of expr * expr * expr * stmt 
  | While of expr * stmt

  type func_decl = {
    (* do we need function keyword here? *)
    typ : typ;
    fname : string;
    formals : bind list;
    locals : bind list;
    body : stmt list;
  }