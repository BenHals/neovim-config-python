return {
    -- "gc" to comment visual regions/lines
    { 'numToStr/Comment.nvim', opts = {} },
    -- select virtual environments
    -- - makes pyright and debugpy aware of the selected virtual environment
    -- - Select a virtual environment with `:VenvSelect`
    {
        "linux-cultist/venv-selector.nvim",
        dependencies = {
            "neovim/nvim-lspconfig",
            "nvim-telescope/telescope.nvim",
            "mfussenegger/nvim-dap-python",
        },
        opts = {
            dap_enabled = true, -- makes the debugger work with venv
        },
    },
    -- Docstring creation
    -- - quickly create docstrings via `<leader>a`
    {
        "danymat/neogen",
        opts = true,
        keys = {
            {
                "<leader>cd",
                function() require("neogen").generate() end,
                desc = "Add Docstring",
            },
        },
    },
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
    },
    {
        "alexghergh/nvim-tmux-navigation",
        config = function()
            local nvim_tmux_nav = require("nvim-tmux-navigation")
            nvim_tmux_nav.setup({
                disable_when_zoomed = true,
                -- defaults to false
                -- keybindings = {
                --   left = "<C-h>",
                --   down = "<C-j>",
                --   up = "<C-k>",
                --   right = "<C-l>",
                --   last_active = "<C-\\>",
                -- },
            })
            vim.keymap.set('n', "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
            vim.keymap.set('n', "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
            vim.keymap.set('n', "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
            vim.keymap.set('n', "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
            vim.keymap.set('n', "<C-L>", nvim_tmux_nav.NvimTmuxNavigateRight)
            vim.keymap.set('n', "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
            vim.keymap.set('n', "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)
        end,
    },
    {
        'm4xshen/hardtime.nvim',
        dependencies = {
            'MunifTanjim/nui.nvim',
            'nvim-lua/plenary.nvim'
        },
        opts = {}

    },
}
