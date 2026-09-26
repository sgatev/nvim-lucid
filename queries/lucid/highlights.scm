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
  "&"
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
(var_decl_stmt name: (ident) @variable)
(type_def name: (ident) @type)

(type (ident) @type)
(field_expr field: (ident) @variable.member)

(bool) @boolean
(number) @number
(string) @string
(comment) @comment
