-- Files ending in `.lu` hold Lucid.
vim.filetype.add({
  extension = {
    lu = 'lucid',
  },
})

-- Tells nvim-treesitter where the parser comes from, so that `:TSInstall
-- lucid` has somewhere to fetch and build it from.
--
-- nvim-treesitter is a table of parsers to add to rather than a function to
-- call, and it need not be on the runtime path yet when this file is read,
-- so the registration is tried again once everything has been loaded.
local function register_parser()
  local ok, parsers = pcall(require, 'nvim-treesitter.parsers')
  if not ok then
    return false
  end

  parsers.lucid = {
    install_info = {
      url = 'https://github.com/sgatev/tree-sitter-lucid',
      branch = 'main',
    },
    tier = 3,
  }
  return true
end

if not register_parser() then
  vim.api.nvim_create_autocmd('VimEnter', {
    once = true,
    callback = register_parser,
  })
end

-- Highlighting is started a buffer at a time, because nvim-treesitter no
-- longer starts it for us. It is left alone where the parser has not been
-- installed, rather than reported on every file opened.
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'lucid',
  callback = function(args)
    pcall(vim.treesitter.start, args.buf, 'lucid')
  end,
})
