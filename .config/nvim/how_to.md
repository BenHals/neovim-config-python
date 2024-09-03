# How to use this config!

Describes the differences between this config and default neovim config. Also includes some tmux changes and useful tips for me to remember :)

# Plugins
- Vim Fugative for git (and Rhubarb for github)
- - Use git commands from NVIM, use the :Git prefix then the normal git command
- - Git UI - :Git
- - In this browser, use g? for help
- - = on modified files to open inline diffs
- - dv to open vertical diff checker
- Diffview.nvim
- - Open with :DiffviewOpen
- - left window shows the current staged/committed text (on an unstaged file), right shows the working tree. Can stage a single line with dp, or revert with do. Or :diffput / :diffget on visual selection.
- - Use :DiffviewFileHistory to see commit history for a set of files, defaults to the project root based on current buffers.

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
- Leap
  - s/S to start search forward or backwards
  - type a 2 character prefix to jump to a location
  - will jump to first one, then show a set of labels on other possible locations
  - type the label to jump to the correct location
  - gs to search in other windows.
  - (Look at spooky, looks very cool but should get used to leap first!)
- targets
  - Adds more text objects, and increases functionality of existing ones.
  - For pair characters, (, {, [, etc, adds a count to handle nesting, e.g., y2i( to yank the outer parenthesis
  - Capital I, A to not select surrounding whitespace, e.g., to maintain formatting
  - add n, l after the a or i to work on the next or previous pairs
  - Adds separator objects, e.g., in a list like (1, 2, 3, 4), we can vi, to select each element
  - can use a to select a comma separated list with brackets like above
  - can use b or q to select any (), {} or '', "" respectively.



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

