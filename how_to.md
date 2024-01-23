# How to use this config!

Describes the differences between this config and default neovim config. Also includes some tmux changes and useful tips for me to remember :)

# Plugins
- Vim Fugative for git (and Rhubarb for github)
- - Use git commands from NVIM, use the :Git prefix then the normal git command
- - Git UI - :Git
- - In this browser, use g? for help
- - = on modified files to open inline diffs
- - dv to open vertical diff checker
- Comment
- - 'gc' to comment visual selection
- Conform
- - '<leader>f' for formatting
- nvim-dap
- - '<leader>dc to start debugger
- - '<leader>db to add breakpoint
- - '<leader>dt to terminate the debugger
- - <leader>di step into
- - <leader>do step over
- - <leader>du for debug ui
- neogen
- - <leader>cd add docstring
- markdown-preview
  - :MarkdownPreviewToggle to toggle
- Undotree
  - <leader>u toggle undotree
- Telescope
  - <leader>? for recent files
  - <leader><space> for existing buffers
  - <leader>/ for fzf in current buffer
  - <leader>gf search git files
  - <leader>sf search files
  - <leader>sh search help
  - <leader>sw search current word
  - <leader>sd search diagnostics
- Treesitter
  - <C-space> select node
  - a, f, c for parameter, function and class textobjects
  - <leader>a, A for swapping parameters
  - ]m, ]M goto next function start, end
  - [m, [M togo previous function start end
  - <leader>rn rename
  - <leader>ca code action
  - gd goto definition
  - gr goto references
  - gI goto implementation
  - <leader>D telescope type definition
  - <leader>ds document symbols
  - <leader>ws workspace symbols
  - K hover docs
  - <C-k> signature documentation
  - gD goto declaration
  - <leader>wa workspace add folder
  - <leader>wr workspace remove folder
  - <leader>wl workspace list folder


# Non-plugin Keybinds
- Local leader is ' ' (Space!)
- 'jk' for esc
  - If you want to type j then k need to wait slightly
- [d, ]d for next, prev diagnostics
- <leader>q to open diagnostic window
- <leader>e to open floating diagnostic window

# Tmux
 - Tmux navigator, so keybinds to move window also work for tmux panes
 - - <C-h, j, k, l> 
 - - <C-\> for last pane
# Misc tips

