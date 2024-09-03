return {
    'lewis6991/satellite.nvim',
    -- Detect tabstop and shiftwidth automatically
    'tpope/vim-sleuth',
    {
        'folke/trouble.nvim',
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {},
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim"
        },
        config = function()
            vim.keymap.set('n', '<C-e>', ':Neotree toggle<CR>')
        end
    },
    -- Useful plugin to show you pending keybinds.
    {
        'folke/which-key.nvim',
    },
    {
        -- Set lualine as statusline
        'nvim-lualine/lualine.nvim',
        -- See `:help lualine.txt`
        opts = {
            options = {
                icons_enabled = false,
                theme = 'auto',
                component_separators = '|',
                section_separators = '',
            },
        },
    },
    {
        "mbbill/undotree",
        config = function()
            vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)
        end
    },
    {
        'wellle/targets.vim'
    },
    {
        'ggandor/leap.nvim',
        config = function()
            require('leap').create_default_mappings()
        end
    },
    {
        "ptdewey/yankbank-nvim",
        config = function()
            require('yankbank').setup()
            vim.keymap.set("n", "<leader>p", "<cmd>YankBank<CR>", { noremap = true })
        end
    },
}
