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

open Parsing;;
let _ = parse_error;;
# 6 "parser.mly"
open Ast
# 49 "parser.ml"
let yytransl_const = [|
  257 (* SEMI *);
  258 (* LPAREN *);
  259 (* RPAREN *);
  260 (* LBRACE *);
  261 (* RBRACE *);
  262 (* COMMA *);
  263 (* LSQUARE *);
  264 (* RSQUARE *);
  265 (* PLUS *);
  266 (* MINUS *);
  267 (* TIMES *);
  268 (* DIVIDE *);
  269 (* ASSIGN *);
  270 (* TRUE *);
  271 (* FALSE *);
  272 (* MOD *);
  273 (* NOT *);
  274 (* EQ *);
  275 (* NEQ *);
  276 (* LT *);
  277 (* LEQ *);
  278 (* GT *);
  279 (* GEQ *);
  280 (* AND *);
  281 (* OR *);
  282 (* INT *);
  283 (* STRING *);
  284 (* VOID *);
  285 (* BOOL *);
  286 (* FLOAT *);
  287 (* RGB *);
  288 (* CANVAS *);
  289 (* POINTER *);
  290 (* FILE *);
  291 (* RETURN *);
    0 (* EOF *);
    0|]

let yytransl_block = [|
  292 (* LITERAL *);
  293 (* BLIT *);
  294 (* ID *);
  295 (* SLIT *);
  296 (* FLIT *);
    0|]

let yylhs = "\255\255\
\001\000\002\000\002\000\002\000\003\000\006\000\006\000\008\000\
\008\000\004\000\009\000\009\000\005\000\005\000\005\000\005\000\
\005\000\005\000\005\000\005\000\005\000\007\000\007\000\011\000\
\011\000\011\000\011\000\012\000\012\000\010\000\010\000\010\000\
\010\000\010\000\010\000\010\000\010\000\010\000\010\000\010\000\
\010\000\010\000\010\000\010\000\010\000\010\000\010\000\010\000\
\010\000\010\000\010\000\010\000\013\000\013\000\014\000\014\000\
\000\000"

let yylen = "\002\000\
\002\000\000\000\002\000\002\000\008\000\000\000\001\000\002\000\
\004\000\003\000\003\000\005\000\001\000\001\000\001\000\001\000\
\001\000\001\000\001\000\001\000\001\000\000\000\002\000\002\000\
\003\000\003\000\001\000\000\000\001\000\001\000\001\000\001\000\
\001\000\003\000\003\000\003\000\003\000\003\000\003\000\003\000\
\003\000\003\000\003\000\003\000\003\000\003\000\002\000\002\000\
\003\000\004\000\004\000\003\000\000\000\001\000\001\000\003\000\
\002\000"

let yydefred = "\000\000\
\002\000\000\000\057\000\000\000\014\000\013\000\015\000\016\000\
\017\000\018\000\019\000\020\000\021\000\001\000\003\000\004\000\
\000\000\000\000\010\000\000\000\000\000\000\000\000\000\008\000\
\000\000\000\000\022\000\000\000\000\000\009\000\000\000\022\000\
\005\000\000\000\000\000\000\000\030\000\031\000\000\000\032\000\
\000\000\027\000\000\000\023\000\000\000\000\000\000\000\047\000\
\048\000\000\000\000\000\000\000\000\000\000\000\000\000\024\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\052\000\026\000\025\000\
\000\000\000\000\000\000\000\000\000\000\011\000\000\000\000\000\
\000\000\036\000\037\000\046\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\050\000\000\000\051\000\000\000\
\000\000\012\000"

let yydgoto = "\002\000\
\003\000\004\000\015\000\016\000\045\000\022\000\029\000\023\000\
\042\000\043\000\044\000\051\000\074\000\075\000"

let yysindex = "\007\000\
\000\000\000\000\000\000\001\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\231\254\060\255\000\000\246\255\237\254\022\255\037\255\000\000\
\041\255\246\255\000\000\009\255\048\255\000\000\122\255\000\000\
\000\000\122\255\122\255\122\255\000\000\000\000\005\255\000\000\
\004\255\000\000\185\255\000\000\049\255\126\000\085\255\000\000\
\000\000\143\000\055\255\122\255\122\255\122\255\001\255\000\000\
\122\255\122\255\122\255\122\255\122\255\122\255\122\255\122\255\
\122\255\122\255\122\255\122\255\122\255\000\000\000\000\000\000\
\143\000\068\255\066\255\143\000\090\255\000\000\122\255\043\255\
\043\255\000\000\000\000\000\000\124\255\124\255\000\255\000\255\
\000\255\000\255\087\255\160\000\000\000\122\255\000\000\210\255\
\143\000\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\091\255\000\000\000\000\097\255\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\100\255\000\000\000\000\160\255\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\103\255\000\000\123\255\000\000\123\255\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\038\255\000\000\125\255\063\255\000\000\000\000\000\000\235\255\
\035\000\000\000\000\000\000\000\103\000\107\000\245\255\045\000\
\070\000\078\000\067\255\014\255\000\000\000\000\000\000\000\000\
\054\255\000\000"

let yygindex = "\000\000\
\000\000\000\000\000\000\000\000\020\000\000\000\095\000\000\000\
\000\000\225\255\000\000\000\000\075\000\000\000"

let yytablesize = 440
let yytable = "\046\000\
\014\000\078\000\048\000\049\000\050\000\054\000\052\000\001\000\
\057\000\058\000\059\000\060\000\018\000\079\000\045\000\061\000\
\045\000\053\000\024\000\045\000\073\000\076\000\073\000\017\000\
\025\000\080\000\081\000\082\000\083\000\084\000\085\000\086\000\
\087\000\088\000\089\000\090\000\091\000\092\000\045\000\021\000\
\055\000\055\000\026\000\055\000\027\000\028\000\030\000\096\000\
\041\000\031\000\054\000\032\000\033\000\059\000\060\000\072\000\
\056\000\034\000\061\000\056\000\019\000\020\000\097\000\049\000\
\035\000\049\000\041\000\044\000\049\000\044\000\093\000\094\000\
\044\000\005\000\006\000\007\000\008\000\009\000\010\000\011\000\
\012\000\013\000\036\000\037\000\038\000\039\000\031\000\040\000\
\032\000\071\000\044\000\044\000\095\000\006\000\034\000\057\000\
\058\000\059\000\060\000\007\000\028\000\035\000\061\000\029\000\
\062\000\063\000\064\000\065\000\066\000\067\000\005\000\006\000\
\007\000\008\000\009\000\010\000\011\000\012\000\013\000\036\000\
\037\000\038\000\039\000\031\000\040\000\053\000\047\000\054\000\
\077\000\000\000\000\000\034\000\057\000\058\000\059\000\060\000\
\000\000\000\000\035\000\061\000\000\000\000\000\000\000\064\000\
\065\000\066\000\067\000\005\000\006\000\007\000\008\000\009\000\
\010\000\011\000\012\000\013\000\000\000\037\000\038\000\039\000\
\033\000\040\000\033\000\000\000\000\000\033\000\000\000\000\000\
\033\000\033\000\033\000\033\000\000\000\000\000\000\000\033\000\
\000\000\033\000\033\000\033\000\033\000\033\000\033\000\033\000\
\033\000\056\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\057\000\058\000\059\000\060\000\000\000\000\000\000\000\
\061\000\000\000\062\000\063\000\064\000\065\000\066\000\067\000\
\068\000\069\000\098\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\057\000\058\000\059\000\060\000\000\000\000\000\
\000\000\061\000\000\000\062\000\063\000\064\000\065\000\066\000\
\067\000\068\000\069\000\034\000\000\000\034\000\000\000\000\000\
\034\000\000\000\000\000\034\000\034\000\040\000\000\000\040\000\
\000\000\000\000\040\000\000\000\034\000\034\000\034\000\034\000\
\034\000\034\000\034\000\034\000\000\000\000\000\040\000\040\000\
\040\000\040\000\040\000\040\000\040\000\040\000\000\000\005\000\
\006\000\007\000\008\000\009\000\010\000\011\000\012\000\013\000\
\000\000\000\000\005\000\006\000\007\000\008\000\009\000\010\000\
\011\000\012\000\013\000\035\000\000\000\035\000\000\000\000\000\
\035\000\000\000\000\000\035\000\035\000\041\000\000\000\041\000\
\000\000\000\000\041\000\000\000\035\000\035\000\035\000\035\000\
\035\000\035\000\035\000\035\000\000\000\000\000\041\000\041\000\
\041\000\041\000\041\000\041\000\041\000\041\000\042\000\000\000\
\042\000\000\000\000\000\042\000\000\000\000\000\043\000\000\000\
\043\000\000\000\000\000\043\000\000\000\000\000\000\000\042\000\
\042\000\042\000\042\000\042\000\042\000\042\000\042\000\043\000\
\043\000\043\000\043\000\043\000\043\000\043\000\043\000\038\000\
\000\000\038\000\000\000\039\000\038\000\039\000\000\000\000\000\
\039\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\038\000\038\000\000\000\000\000\039\000\039\000\038\000\038\000\
\070\000\000\000\039\000\039\000\000\000\000\000\057\000\058\000\
\059\000\060\000\000\000\000\000\000\000\061\000\000\000\062\000\
\063\000\064\000\065\000\066\000\067\000\068\000\069\000\057\000\
\058\000\059\000\060\000\000\000\000\000\000\000\061\000\000\000\
\062\000\063\000\064\000\065\000\066\000\067\000\068\000\069\000\
\057\000\058\000\059\000\060\000\000\000\000\000\000\000\061\000\
\000\000\062\000\063\000\064\000\065\000\066\000\067\000\068\000"

let yycheck = "\031\000\
\000\000\001\001\034\000\035\000\036\000\002\001\002\001\001\000\
\009\001\010\001\011\001\012\001\038\001\013\001\001\001\016\001\
\003\001\013\001\038\001\006\001\052\000\053\000\054\000\004\000\
\003\001\057\000\058\000\059\000\060\000\061\000\062\000\063\000\
\064\000\065\000\066\000\067\000\068\000\069\000\025\001\020\000\
\003\001\038\001\006\001\006\001\004\001\026\000\038\001\079\000\
\029\000\002\001\002\001\004\001\005\001\011\001\012\001\001\001\
\003\001\010\001\016\001\006\001\001\001\002\001\094\000\001\001\
\017\001\003\001\047\000\001\001\006\001\003\001\003\001\006\001\
\006\001\026\001\027\001\028\001\029\001\030\001\031\001\032\001\
\033\001\034\001\035\001\036\001\037\001\038\001\002\001\040\001\
\004\001\005\001\024\001\025\001\003\001\003\001\010\001\009\001\
\010\001\011\001\012\001\003\001\001\001\017\001\016\001\001\001\
\018\001\019\001\020\001\021\001\022\001\023\001\026\001\027\001\
\028\001\029\001\030\001\031\001\032\001\033\001\034\001\035\001\
\036\001\037\001\038\001\002\001\040\001\003\001\032\000\003\001\
\054\000\255\255\255\255\010\001\009\001\010\001\011\001\012\001\
\255\255\255\255\017\001\016\001\255\255\255\255\255\255\020\001\
\021\001\022\001\023\001\026\001\027\001\028\001\029\001\030\001\
\031\001\032\001\033\001\034\001\255\255\036\001\037\001\038\001\
\001\001\040\001\003\001\255\255\255\255\006\001\255\255\255\255\
\009\001\010\001\011\001\012\001\255\255\255\255\255\255\016\001\
\255\255\018\001\019\001\020\001\021\001\022\001\023\001\024\001\
\025\001\001\001\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\009\001\010\001\011\001\012\001\255\255\255\255\255\255\
\016\001\255\255\018\001\019\001\020\001\021\001\022\001\023\001\
\024\001\025\001\001\001\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\009\001\010\001\011\001\012\001\255\255\255\255\
\255\255\016\001\255\255\018\001\019\001\020\001\021\001\022\001\
\023\001\024\001\025\001\001\001\255\255\003\001\255\255\255\255\
\006\001\255\255\255\255\009\001\010\001\001\001\255\255\003\001\
\255\255\255\255\006\001\255\255\018\001\019\001\020\001\021\001\
\022\001\023\001\024\001\025\001\255\255\255\255\018\001\019\001\
\020\001\021\001\022\001\023\001\024\001\025\001\255\255\026\001\
\027\001\028\001\029\001\030\001\031\001\032\001\033\001\034\001\
\255\255\255\255\026\001\027\001\028\001\029\001\030\001\031\001\
\032\001\033\001\034\001\001\001\255\255\003\001\255\255\255\255\
\006\001\255\255\255\255\009\001\010\001\001\001\255\255\003\001\
\255\255\255\255\006\001\255\255\018\001\019\001\020\001\021\001\
\022\001\023\001\024\001\025\001\255\255\255\255\018\001\019\001\
\020\001\021\001\022\001\023\001\024\001\025\001\001\001\255\255\
\003\001\255\255\255\255\006\001\255\255\255\255\001\001\255\255\
\003\001\255\255\255\255\006\001\255\255\255\255\255\255\018\001\
\019\001\020\001\021\001\022\001\023\001\024\001\025\001\018\001\
\019\001\020\001\021\001\022\001\023\001\024\001\025\001\001\001\
\255\255\003\001\255\255\001\001\006\001\003\001\255\255\255\255\
\006\001\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\018\001\019\001\255\255\255\255\018\001\019\001\024\001\025\001\
\003\001\255\255\024\001\025\001\255\255\255\255\009\001\010\001\
\011\001\012\001\255\255\255\255\255\255\016\001\255\255\018\001\
\019\001\020\001\021\001\022\001\023\001\024\001\025\001\009\001\
\010\001\011\001\012\001\255\255\255\255\255\255\016\001\255\255\
\018\001\019\001\020\001\021\001\022\001\023\001\024\001\025\001\
\009\001\010\001\011\001\012\001\255\255\255\255\255\255\016\001\
\255\255\018\001\019\001\020\001\021\001\022\001\023\001\024\001"

let yynames_const = "\
  SEMI\000\
  LPAREN\000\
  RPAREN\000\
  LBRACE\000\
  RBRACE\000\
  COMMA\000\
  LSQUARE\000\
  RSQUARE\000\
  PLUS\000\
  MINUS\000\
  TIMES\000\
  DIVIDE\000\
  ASSIGN\000\
  TRUE\000\
  FALSE\000\
  MOD\000\
  NOT\000\
  EQ\000\
  NEQ\000\
  LT\000\
  LEQ\000\
  GT\000\
  GEQ\000\
  AND\000\
  OR\000\
  INT\000\
  STRING\000\
  VOID\000\
  BOOL\000\
  FLOAT\000\
  RGB\000\
  CANVAS\000\
  POINTER\000\
  FILE\000\
  RETURN\000\
  EOF\000\
  "

let yynames_block = "\
  LITERAL\000\
  BLIT\000\
  ID\000\
  SLIT\000\
  FLIT\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'decls) in
    Obj.repr(
# 37 "parser.mly"
            ( _1 )
# 339 "parser.ml"
               : Ast.program))
; (fun __caml_parser_env ->
    Obj.repr(
# 40 "parser.mly"
                 ( ([], [])               )
# 345 "parser.ml"
               : 'decls))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'decls) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fdecl) in
    Obj.repr(
# 41 "parser.mly"
               ( (fst _1, (_2 :: snd _1)) )
# 353 "parser.ml"
               : 'decls))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'decls) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'vdecl) in
    Obj.repr(
# 42 "parser.mly"
               ( ((_2 :: fst _1), snd _1) )
# 361 "parser.ml"
               : 'decls))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 7 : 'typ) in
    let _2 = (Parsing.peek_val __caml_parser_env 6 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 4 : 'formals_opt) in
    let _7 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    Obj.repr(
# 46 "parser.mly"
  ( { 
   typ = _1;
	 fname = _2;
	 formals = List.rev _4;
	 body = List.rev _7 } )
# 375 "parser.ml"
               : 'fdecl))
; (fun __caml_parser_env ->
    Obj.repr(
# 53 "parser.mly"
                  ( [] )
# 381 "parser.ml"
               : 'formals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'formal_list) in
    Obj.repr(
# 54 "parser.mly"
                  ( _1 )
# 388 "parser.ml"
               : 'formals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'typ) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 57 "parser.mly"
                             ( [(_1,_2)]     )
# 396 "parser.ml"
               : 'formal_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : 'formal_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'typ) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 58 "parser.mly"
                             ( (_3,_4) :: _1 )
# 405 "parser.ml"
               : 'formal_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'typ) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : string) in
    Obj.repr(
# 61 "parser.mly"
                ( (_1, _2) )
# 413 "parser.ml"
               : 'vdecl))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'typ) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : string) in
    Obj.repr(
# 64 "parser.mly"
                ( Var(_1,_2) )
# 421 "parser.ml"
               : 'vdecl_stmt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 4 : 'typ) in
    let _2 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 65 "parser.mly"
                            ( VarAssign(_1,_2,_4))
# 430 "parser.ml"
               : 'vdecl_stmt))
; (fun __caml_parser_env ->
    Obj.repr(
# 68 "parser.mly"
           ( String )
# 436 "parser.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 69 "parser.mly"
        ( Int )
# 442 "parser.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 70 "parser.mly"
         ( Void )
# 448 "parser.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 71 "parser.mly"
         ( Bool )
# 454 "parser.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 72 "parser.mly"
          ( Float )
# 460 "parser.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 73 "parser.mly"
        ( Rgb )
# 466 "parser.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 74 "parser.mly"
           ( Canvas )
# 472 "parser.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 76 "parser.mly"
            ( Pointer )
# 478 "parser.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 77 "parser.mly"
         ( File )
# 484 "parser.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 80 "parser.mly"
                   ( [] )
# 490 "parser.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 81 "parser.mly"
                   ( _2 :: _1 )
# 498 "parser.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 84 "parser.mly"
                                            ( Expr _1   )
# 505 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr_opt) in
    Obj.repr(
# 85 "parser.mly"
                                            ( Return _2 )
# 512 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    Obj.repr(
# 86 "parser.mly"
                                            ( Block(List.rev _2) )
# 519 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'vdecl_stmt) in
    Obj.repr(
# 87 "parser.mly"
                                            ( _1 )
# 526 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    Obj.repr(
# 90 "parser.mly"
          ( Noexpr )
# 532 "parser.ml"
               : 'expr_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 91 "parser.mly"
          ( _1 )
# 539 "parser.ml"
               : 'expr_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 94 "parser.mly"
                     ( Literal(_1)            )
# 546 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : bool) in
    Obj.repr(
# 95 "parser.mly"
                     ( BoolLit(_1)            )
# 553 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 96 "parser.mly"
                     ( Fliteral(_1)           )
# 560 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 98 "parser.mly"
                     ( Id(_1) )
# 567 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 99 "parser.mly"
                     ( Binop(_1, Add,   _3)   )
# 575 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 100 "parser.mly"
                     ( Binop(_1, Sub,   _3)   )
# 583 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 101 "parser.mly"
                     ( Binop(_1, Mul,  _3)   )
# 591 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 102 "parser.mly"
                     ( Binop(_1, Div,   _3)   )
# 599 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 103 "parser.mly"
                     ( Binop(_1, Equal, _3)   )
# 607 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 104 "parser.mly"
                     ( Binop(_1, Neq,   _3)   )
# 615 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 105 "parser.mly"
                     ( Binop(_1, Less,  _3)   )
# 623 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 106 "parser.mly"
                     ( Binop(_1, Leq,   _3)   )
# 631 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 107 "parser.mly"
                     ( Binop(_1, Greater, _3) )
# 639 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 108 "parser.mly"
                     ( Binop(_1, Geq,   _3)   )
# 647 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 109 "parser.mly"
                     ( Binop(_1, And,   _3)   )
# 655 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 110 "parser.mly"
                     ( Binop(_1, Or,    _3)   )
# 663 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 112 "parser.mly"
                     ( Binop(_1, Mod,   _3)   )
# 671 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 113 "parser.mly"
                         ( Unop(Neg, _2)      )
# 678 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 114 "parser.mly"
                     ( Unop(Not, _2)          )
# 685 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 115 "parser.mly"
                     ( Assign(_1, _3)         )
# 693 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'args_opt) in
    Obj.repr(
# 116 "parser.mly"
                              ( Call(_1, _3)  )
# 701 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : 'typ) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'args_opt) in
    Obj.repr(
# 117 "parser.mly"
                                      ( Call((string_of_typ _1), _3) )
# 709 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 118 "parser.mly"
                       ( _2                   )
# 716 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 123 "parser.mly"
                  ( [] )
# 722 "parser.ml"
               : 'args_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'args_list) in
    Obj.repr(
# 124 "parser.mly"
               ( List.rev _1 )
# 729 "parser.ml"
               : 'args_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 127 "parser.mly"
                            ( [_1] )
# 736 "parser.ml"
               : 'args_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'args_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 128 "parser.mly"
                         ( _3 :: _1 )
# 744 "parser.ml"
               : 'args_list))
(* Entry program *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
|]
let yytables =
  { Parsing.actions=yyact;
    Parsing.transl_const=yytransl_const;
    Parsing.transl_block=yytransl_block;
    Parsing.lhs=yylhs;
    Parsing.len=yylen;
    Parsing.defred=yydefred;
    Parsing.dgoto=yydgoto;
    Parsing.sindex=yysindex;
    Parsing.rindex=yyrindex;
    Parsing.gindex=yygindex;
    Parsing.tablesize=yytablesize;
    Parsing.table=yytable;
    Parsing.check=yycheck;
    Parsing.error_function=parse_error;
    Parsing.names_const=yynames_const;
    Parsing.names_block=yynames_block }
let program (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 1 lexfun lexbuf : Ast.program)
