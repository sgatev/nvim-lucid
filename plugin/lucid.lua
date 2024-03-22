-- Register the language.
vim.filetype.add({
  extension = {
    lu = 'lucid',
  },
})

-- Register the Tree-sitter parser.
local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.lucid = {
  install_info = {
    url = "https://github.com/sgatev/tree-sitter-lucid",
    files = {"src/parser.c"},
    branch = "main",
    generate_requires_npm = false,
    requires_generate_from_grammar = false,
  },
  filetype = "lu"
}
vim.treesitter.language.register('lucid', 'lucid')
