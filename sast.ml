(* SAST for Reptile *)
(* Aviva Weinbaum, Lindsey Weiskopf, Hariti Patel, Aileen Cano *)

open Ast

type sexpr = typ * sx
and sx =
    SBinop of sexpr * operator * sexpr
  | SUnop of unoperator * expr
  | SInc of sexpr * incoperator
  | SLiteral of int
  | SFliteral of string
  | SBoolLit of bool
  | SId of string
  | SString of string
  | SAssign of string * sexpr
  | SCall of string * sexpr list
  | SArrayAccess of string * sexpr
  | SArrayLit of sexpr list 
  | SNoexpr

type sstmt = 
    SExpr of sexpr
  | SReturn of sexpr
  | SBlock of sstmt list
  | SIf of sexpr * sstmt * sstmt
  | SFor of sexpr * sexpr * sexpr * sstmt 
  | SWhile of sexpr * sstmt

type sfunc_decl = {
    styp : typ;
    sfname : string;
    sformals : bind list;
    slocals : bind list;
    sbody : sstmt list;
  }

  type sprogram = bind list * sfunc_decl list