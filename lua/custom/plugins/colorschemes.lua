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
                integrations = {
                    headlines = true
                }
            })

            vim.cmd.colorscheme "catppuccin"
            vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = '#51B3EC', bold = true })
            vim.api.nvim_set_hl(0, 'LineNr', { fg = 'white', bold = true })
            vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = '#FB508F', bold = true })
        end
    },
    {
        'rose-pine/neovim',
        name = 'rose-pine',
        priority = 1000,
        config = function()
            local opts = {
                highlight_groups = {
                    Cursor = { fg = '#ffffff', bg = '#ffffff' }
                },
                variant = "auto",
                styles = {
                    transparency = true
                }
            }
            require("rose-pine").setup(opts)
            vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = '#51B3EC', bold = true })
            vim.api.nvim_set_hl(0, 'LineNr', { fg = 'white', bold = true })
            vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = '#FB508F', bold = true })
        end
    },
    {
        "eldritch-theme/eldritch.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            local opts = {}
            require("eldritch").setup(opts)
            vim.cmd.colorscheme "eldritch"
            vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = '#51B3EC', bold = true })
            vim.api.nvim_set_hl(0, 'LineNr', { fg = 'white', bold = true })
            vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = '#FB508F', bold = true })
        end
    },
}
