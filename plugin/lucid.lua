-- Files ending in `.lu` hold Lucid code.
vim.filetype.add({
  extension = {
    lu = 'lucid',
  },
})

-- Tells nvim-treesitter where the parser comes from, so that installing it
-- has somewhere to fetch and build it from.
--
-- nvim-treesitter throws its table of parsers away and reads it again before
-- every install, so where the parser comes from has to be said again each
-- time. `User TSUpdate` is fired for exactly that, and listening for it also
-- means nvim-treesitter need not be loadable when this file is read.
vim.api.nvim_create_autocmd('User', {
  pattern = 'TSUpdate',
  callback = function()
    require('nvim-treesitter.parsers').lucid = {
      install_info = {
        url = 'https://github.com/sgatev/tree-sitter-lucid',
        branch = 'main',
      },
      tier = 3,
    }
  end,
})

-- Highlighting is started a buffer at a time, because nvim-treesitter no
-- longer starts it for us. It is left alone where the parser has not been
-- installed, rather than reported on every file opened.
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'lucid',
  callback = function(args)
    pcall(vim.treesitter.start, args.buf, 'lucid')
  end,
})
