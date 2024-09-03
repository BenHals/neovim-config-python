return {
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
