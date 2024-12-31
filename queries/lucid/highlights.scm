[
  "let"
  "return"
  "if"
  "do"
  "loop"
  "break"
  "else"
] @keyword

[
  "="
  "->"
  "=="
  ">"
  "<"
  "+"
  "-"
  "%"
] @operator

[
  ","
  ":"
] @punctuation.delimiter

[
  "("
  ")"
  "["
  "]"
  "{"
  "}"
] @punctuation.bracket

[
  (number)
] @number

[
  (string)
] @string

(comment) @comment
