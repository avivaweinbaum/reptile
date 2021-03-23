(* SAST for Reptile *)
(* Aviva Weinbaum, Lindsey Weiskopf, Hariti Patel, Aileen Cano *)

open Ast

type sexpr = typ * sx
and sx =
    SBinop of sexpr * operator * sexpr
  | SUnop of unoperator * expr
  | SInc of sexpr * incoperator
  | SLiteral of int
  | SCall of string * sexpr list
  | SNoexpr

type sstmt = 
    SExpr of sexpr
  | SBlock of stmt list

type sfunc_decl = {
    sfname : string;
    sformals : bind list;
    sbody : sstmt list;
  }

  type sprogram = bind list * sfunc_decl list