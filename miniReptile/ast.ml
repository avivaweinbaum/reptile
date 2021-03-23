(* AST for Reptile *)
(* Aviva Weinbaum, Lindsey Weiskopf, Hariti Patel, Aileen Cano *)

type operator = Add | Sub | Mul | Div | Equal | Neq | Less | Greater | Geq | 
          And | Or | Exp | Mod

type unoperator = Not | Neg
type incoperator = Incr | Decr

type typ = Int

type expr =
    Binop of expr * operator * expr
  | Unop of unoperator * expr
  | Inc of expr * incoperator
  | Literal of int
  | Call of string * expr
  | Noexpr

type stmt = 
    Expr of expr
  | Block of stmt list

  type func_decl = {
    fname : string;
    formals : bind list;
    body : stmt list;
  }

  type program = bind list * func_decl list