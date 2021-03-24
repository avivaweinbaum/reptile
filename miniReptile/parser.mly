/* Ocamlyacc parser for Reptile */
/* Inspo from SSOL (2017), Crayon (2017), and MicroC */
/* Aviva Weinbaum, Lindsey Weiskopf, Hariti Patel, Aileen Cano */

%{
open Ast
%}

%token SEMI LPAREN RPAREN LBRACE RBRACE COMMA LSQUARE RSQUARE
%token PLUS MINUS TIMES DIVIDE
%token TRUE FALSE
%token EXP INCR DECR MOD
%token NOT EQ NEQ LT LEQ GT GEQ AND OR
%token INT STRING VOID BOOL
%token <int> LITERAL
%token <bool> BLIT
%token <string> ID SLIT
%token EOF

%start program
%type <Ast.program> program

%left OR
%left AND
%left EQ NEQ
%left LT GT LEQ GEQ
%left PLUS MINUS
%left TIMES DIVIDE MOD
%right INCR DECR
%left EXP
%right NOT

%%

program:
  decls EOF { $1 }

decls:
   /* nothing */ { ([], [])               }
 | decls fdecl { (fst $1, ($2 :: snd $1)) }

fdecl:
  typ ID LPAREN formals_opt RPAREN LBRACE stmt_list RBRACE
  { { 
   typ = $1;
	 fname = $2;
	 formals = List.rev $4;
	 body = List.rev $7 } }

formals_opt:
    /* nothing */ { [] }
  | formal_list   { $1 }

formal_list:
    typ ID                   { [($1,$2)]     }
  | formal_list COMMA typ ID { ($3,$4) :: $1 }

typ:
    STRING { String }
  | INT { Int }
  | VOID { Void }
  | BOOL { Bool }

stmt_list:
    /* nothing */  { [] }
  | stmt_list stmt { $2 :: $1 }

stmt:
    expr SEMI                               { Expr $1   }
  | LBRACE stmt_list RBRACE                 { Block(List.rev $2) }

expr:
    LITERAL          { Literal($1)            }
  | BLIT             { BoolLit($1)            }
  | SLIT             { String($1)             }
  | ID               { Id($1) }
  | expr PLUS   expr { Binop($1, Add,   $3)   }
  | expr MINUS  expr { Binop($1, Sub,   $3)   }
  | expr TIMES  expr { Binop($1, Mul,  $3)   }
  | expr DIVIDE expr { Binop($1, Div,   $3)   }
  | expr EQ     expr { Binop($1, Equal, $3)   }
  | expr NEQ    expr { Binop($1, Neq,   $3)   }
  | expr LT     expr { Binop($1, Less,  $3)   }
  | expr LEQ    expr { Binop($1, Leq,   $3)   }
  | expr GT     expr { Binop($1, Greater, $3) }
  | expr GEQ    expr { Binop($1, Geq,   $3)   }
  | expr AND    expr { Binop($1, And,   $3)   }
  | expr OR     expr { Binop($1, Or,    $3)   }
  | expr EXP    expr { Binop($1, Exp,   $3)   }
  | expr MOD    expr { Binop($1, Mod,   $3)   }
  | MINUS expr %prec NOT { Unop(Neg, $2)      }
  | NOT expr         { Unop(Not, $2)          }
  | expr INCR        { Inc($1, Incr)         }
  | expr DECR        { Inc($1, Decr)         }
  | ID LPAREN args_opt RPAREN { Call($1, $3)  }
  | LPAREN expr RPAREN { $2                   }
  | TRUE             { BoolLit(true) }
  | FALSE            { BoolLit(false) }

args_opt:
    /* nothing */ { [] }
  | args_list  { List.rev $1 }

args_list:
    expr                    { [$1] }
  | args_list COMMA expr { $3 :: $1 }
