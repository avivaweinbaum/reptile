/* Ocamlyacc parser for Reptile */
/* Inspo from SSOL (2017), Crayon (2017), and MicroC */
/* Aviva Weinbaum, Lindsey Weiskopf, Hariti Patel, Aileen Cano */

%{
open Ast
%}

%token SEMI LPAREN RPAREN LBRACE RBRACE COMMA
%token PLUS MINUS TIMES DIVIDE ASSIGN
%token TRUE FALSE
%token NOT EQ NEQ LT LEQ GT GEQ AND OR
%token INT STRING VOID BOOL FLOAT
%token RGB CANVAS POINTER
%token RETURN WHILE
%token RETURN IF ELSE
%token <int> LITERAL
%token <bool> BLIT
%token <string> ID SLIT FLIT
%token EOF

%start program
%type <Ast.program> program

%nonassoc NOELSE
%nonassoc ELSE
%right ASSIGN
%left OR
%left AND
%left EQ NEQ
%left LT GT LEQ GEQ
%left PLUS MINUS
%left TIMES DIVIDE
%left EXP
%right NOT

%%

program:
  decls EOF { $1 }

decls:
   /* nothing */ { ([], [])               }
 | decls fdecl { (fst $1, ($2 :: snd $1)) }
 | decls vdecl { (($2 :: fst $1), snd $1) }

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

vdecl:
    typ ID SEMI { ($1, $2) }

vdecl_stmt:
    typ ID SEMI { Var($1,$2) }
  | typ ID ASSIGN expr SEMI { VarAssign($1,$2,$4)}

typ:
    STRING { String }
  | INT { Int }
  | VOID { Void }
  | BOOL { Bool }
  | FLOAT { Float }
  | RGB { Rgb }
  | CANVAS { Canvas }
  | POINTER { Pointer }

stmt_list:
    /* nothing */  { [] }
  | stmt_list stmt { $2 :: $1 }

stmt:
    expr SEMI                               { Expr $1   }
  | RETURN expr_opt SEMI                    { Return $2 }
  | LBRACE stmt_list RBRACE                 { Block(List.rev $2) }
  | IF LPAREN expr RPAREN stmt %prec NOELSE { If($3, $5, Block([])) }
  | IF LPAREN expr RPAREN stmt ELSE stmt    { If($3, $5, $7)        }
  | vdecl_stmt                              { $1 }
  | WHILE LPAREN expr RPAREN stmt           { While($3, $5) }

expr_opt:
          { Noexpr }
  | expr  { $1 }

expr:
    LITERAL          { Literal($1)            }
  | BLIT             { BoolLit($1)            }
  | FLIT             { Fliteral($1)           }
  | SLIT             { Sliteral($1)             }
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
  | MINUS expr %prec NOT { Unop(Neg, $2)      }
  | NOT expr         { Unop(Not, $2)          }
  | ID ASSIGN expr   { Assign($1, $3)         }
  | ID LPAREN args_opt RPAREN { Call($1, $3)  }
  | typ LPAREN args_opt RPAREN        { Call((string_of_typ $1), $3) }
  | LPAREN expr RPAREN { $2                   }

args_opt:
    /* nothing */ { [] }
  | args_list  { List.rev $1 }

args_list:
    expr                    { [$1] }
  | args_list COMMA expr { $3 :: $1 }
