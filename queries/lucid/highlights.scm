; Keywords are not reserved in Lucid: each is an identifier the parser
; recognises where one is expected, which is where these match it.
[
  "comp"
  "fun"
  "val"
  "Type"
] @keyword

[
  "if"
  "else"
] @keyword.conditional

"loop" @keyword.repeat

; The whole statement is the one token, so there is no word inside it.
(break_stmt) @keyword.repeat

"return" @keyword.return

"do" @keyword

; The mark that says a write can reach something, both where it is declared
; and where it is written. On a declaration or a parameter it is a node of its
; own, so that the tree says whether a write can reach it.
[
  "mut"
  (mutable_specifier)
] @keyword.modifier

[
  "and"
  "or"
] @keyword.operator

[
  "="
  "=="
  "!="
  ">"
  "<"
  ">="
  "<="
  "+"
  "-"
  "*"
  "/"
  "%"
  "!"
] @operator

[
  ","
  ":"
  "."
] @punctuation.delimiter

[
  "("
  ")"
  "["
  "]"
  "{"
  "}"
] @punctuation.bracket

(func_def name: (ident) @function)
(call_expr function: (ident) @function.call)

(param name: (ident) @variable.parameter)
(field_decl name: (ident) @variable.member)
(var_decl_stmt name: (ident) @variable)
(type_def name: (ident) @type)

(type (ident) @type)
(field_expr field: (ident) @variable.member)

(bool) @boolean
(number) @number
(string) @string
(comment) @comment
