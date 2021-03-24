type token =
  | SEMI
  | LPAREN
  | RPAREN
  | LBRACE
  | RBRACE
  | COMMA
  | LSQUARE
  | RSQUARE
  | PLUS
  | MINUS
  | TIMES
  | DIVIDE
  | TRUE
  | FALSE
  | EXP
  | INCR
  | DECR
  | MOD
  | NOT
  | EQ
  | NEQ
  | LT
  | LEQ
  | GT
  | GEQ
  | AND
  | OR
  | FUNCTION
  | INT
  | STRING
  | VOID
  | BOOL
  | LITERAL of (int)
  | ID of (string)
  | SLIT of (string)
  | EOF

val program :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Ast.program
