return {
    {
        'catppuccin/nvim',
        lazy = false,
        name = 'catppuccin',
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                flavour = "macchiato",
                transparent_background = true,
            })

            vim.cmd.colorscheme "catppuccin"
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
            variant = "auto",
            styles = {
                transparency = true
            }
        },
    },
}
