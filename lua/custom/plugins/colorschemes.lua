return {
    {
        'catppuccin/nvim',
        lazy = false,
        name = 'catppuccin',
        priority = 1000,
        opts = {
            flavor = "macchiato"
        },
        config = function()
            vim.cmd.colorscheme "catppuccin-macchiato"
        end
    },
    {
        'rose-pine/neovim',
        name = 'rose-pine',
        priority = 1000,
        opts = {
            highlight_groups = {
                Cursor = { fg = '#ffffff', bg = '#ffffff' }
            },
            variant = "auto"
        },
        config = function()
            -- vim.cmd.colorscheme "rose-pine"
        end
    },
}
