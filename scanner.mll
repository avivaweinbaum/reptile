(* Ocamllex scanner for Reptile *)
(* Aviva Weinbaum, Lindsey Weiskopf, Hariti Patel, Aileen Cano *)

{ open Parser }

let digit = ['0' - '9']
let digits = digit+

rule token = parse
  [' ' '\t' '\r' '\n'] { token lexbuf } (* Whitespace *)
| "/\\"     { comment lexbuf }           (* Comments *)
| '('      { LPAREN }
| ')'      { RPAREN }
| '{'      { LBRACE }
| '}'      { RBRACE }
| ';'      { SEMI }
| ','      { COMMA }
| '='      { ASSIGN }
| '+'      { PLUS }
| '-'      { MINUS }
| '*'      { TIMES }
| '/'      { DIVIDE }
| "=="     { EQ }
| "!="     { NEQ }
| '<'      { LT }
| "<="     { LEQ }
| ">"      { GT }
| ">="     { GEQ }
| "&&"     { AND }
| "||"     { OR }
| "!"      { NOT }
| "if"     { IF }
| "else"   { ELSE }
| "int"    { INT }
| "string" { STRING }
| "float"  { FLOAT }
| "void"   { VOID }
| "bool"   { BOOL }
| "Rgb"    { RGB }
| "Canvas" { CANVAS }
| "Pointer" { POINTER }
| "true"   { BLIT(true) }
| "false"   { BLIT(false) }
| "while"  { WHILE }
| "return" { RETURN }
| digits '.'  digit* ( ['e' 'E'] ['+' '-']? digits )? as lxm { FLIT(lxm) }
| digits as lxm { LITERAL(int_of_string lxm) }
| ['a'-'z' 'A'-'Z']['a'-'z' 'A'-'Z' '0'-'9' '_']*     as lxm { ID(lxm) }
| '"' ([^ '"']* as str) '"' { SLIT(str) }
| eof { EOF }
| _ as char { raise (Failure("illegal character " ^ Char.escaped char)) }

and comment = parse
  "\n" { token lexbuf }
| _    { comment lexbuf }
