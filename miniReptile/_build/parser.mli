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
  | DOT
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
  | WHILE
  | IF
  | ELSE
  | LITERAL of (int)
  | BLIT of (bool)
  | ID of (string)
  | SLIT of (string)
  | FLIT of (string)
  | EOF

val program :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Ast.program
