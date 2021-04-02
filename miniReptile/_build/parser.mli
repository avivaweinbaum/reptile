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
  | ASSIGN
  | TRUE
  | FALSE
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
  | INT
  | STRING
  | VOID
  | BOOL
  | FLOAT
  | RGB
  | CANVAS
  | POINTER
  | FILE
  | RETURN
  | LITERAL of (int)
  | BLIT of (bool)
  | ID of (string)
  | SLIT of (string)
  | FLIT of (string)
  | EOF

val program :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Ast.program
