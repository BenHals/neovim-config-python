vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  { import = 'custom.plugins' }
})

require('options')
require('keybinds')

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

-- vim.g.clipboard = {
--   name = 'WslClipboard',
--   copy = {
--     ["+"] = { 'clip.exe' },
--     ["*"] = { 'clip.exe' },
--   },
--   paste = {
--     ["+"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
--     ["*"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
--   },
--   cache_enabled = true,
-- }
-- The line beneath this is called `modeline`. See `:help modeline`

vim.diagnostic.config({ float = { source = 'always', border = vim.g.border_chars }, })

set_hc_line_numbers = function()
  vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = '#51B3EC', bold = true })
  vim.api.nvim_set_hl(0, 'LineNr', { fg = 'white', bold = true })
  vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = '#FB508F', bold = true })
end

vim.api.nvim_create_user_command("SetHCLN", set_hc_line_numbers, {})
local scrollbar_enabled = true
function toggle_scrollbar()
  if scrollbar_enabled then
    vim.cmd(':SatelliteDisable')
  else
    vim.cmd(':SatelliteEnable')
  end

  scrollbar_enabled = not scrollbar_enabled
end

vim.keymap.set('n', '<leader>es', toggle_scrollbar)
