-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- -- Overwrite netrw keybinds
-- vim.api.nvim_create_autocmd('FileType', {
--   pattern = 'netrw',
--   group = vim.api.nvim_create_augroup('general-settings', { clear = true }),
--   callback = function()
--     print 'test2'
--     vim.api.nvim_set_keymap('n', '<C-l>', '<Plug>NvimTmuxNavigateRight', { noremap = true, silent = true, nowait = true })
--   end,
-- })
