return {
    -- DEBUGGING

    -- DAP Client for nvim
    -- - start the debugger with `<leader>dc`
    -- - add breakpoints with `<leader>db`
    -- - terminate the debugger `<leader>dt`
    {
        "mfussenegger/nvim-dap",
        keys = {
            {
                "<leader>dc",
                function() require("dap").continue() end,
                desc = "Start/Continue Debugger",
            },
            {
                "<leader>di",
                function() require("dap").step_into() end,
                desc = "Debugger Step Into",
            },
            {
                "<leader>do",
                function() require("dap").step_over() end,
                desc = "Debugger Step Over",
            },
            {
                "<leader>dr",
                function() require("dap").repl.toggle() end,
                desc = "Debugger REPL Toggle",
            },
            {
                "<leader>db",
                function() require("dap").toggle_breakpoint() end,
                desc = "Add Breakpoint",
            },
            {
                "<leader>dt",
                function() require("dap").terminate() end,
                desc = "Terminate Debugger",
            },
            {
                "<leader>dl",
                function() require('neotest').summary.toggle() end,
                desc = "Toggle summary list",
            },
            {
                "<leader>dt",
                function() require('neotest').run.run() end,
                desc = "Run test",
            },
            {
                "<leader>dT",
                function() require('neotest').run.run(vim.fn.expand("%")) end,
                desc = "Run Tests in File",
            },
            {
                "<leader>dm",
                function() require('neotest').run.run({ strategy = "dap" }) end,
                desc = "Debug test",
            },
        },
        config = function()
            local dap, dapui = require("dap"), require("dapui")
            dapui.setup()
        end
    },

    -- UI for the debugger
    -- - the debugger UI is also automatically opened when starting/stopping the debugger
    -- - toggle debugger UI manually with `<leader>du`
    {
        "rcarriga/nvim-dap-ui",
        keys = {
            {
                "<leader>du",
                function()
                    require("dapui").toggle()
                end,
                silent = true,
            },
        },
        opts = {
            icons = { expanded = "∩â¥", collapsed = "∩âÜ", circular = "∩äÉ" },
            mappings = {
                expand = { "<CR>", "<2-LeftMouse>" },
                open = "o",
                remove = "d",
                edit = "e",
                repl = "r",
                toggle = "t",
            },
            layouts = {
                {
                    elements = {
                        { id = "repl",    size = 0.30 },
                        { id = "console", size = 0.70 },
                    },
                    size = 0.19,
                    position = "bottom",
                },
                {
                    elements = {
                        { id = "scopes",      size = 0.30 },
                        { id = "breakpoints", size = 0.20 },
                        { id = "stacks",      size = 0.10 },
                        { id = "watches",     size = 0.30 },
                    },
                    size = 0.20,
                    position = "right",
                },
            },
            controls = {
                enabled = true,
                element = "repl",
                icons = {
                    pause = "ε½æ",
                    play = "ε½ô",
                    step_into = "ε½ö",
                    step_over = "ε½û ",
                    step_out = "ε½ò",
                    step_back = "ε«Å ",
                    run_last = "ε¼╖ ",
                    terminate = "ε½ù ",
                },
            },
            floating = {
                max_height = 0.9,
                max_width = 0.5,
                border = vim.g.border_chars,
                mappings = {
                    close = { "q", "<Esc>" },
                },
            },
        },
        config = function(_, opts)
            -- local icons = require("core.icons").dap
            -- for name, sign in pairs(icons) do
            --   ---@diagnostic disable-next-line: cast-local-type
            --   sign = type(sign) == "table" and sign or { sign }
            --   vim.fn.sign_define("Dap" .. name, { text = sign[1] })
            -- end
            require("dapui").setup(opts)
        end,
    },

    -- Configuration for the python debugger
    -- - configures debugpy for us
    -- - uses the debugpy installation from mason
    {
        "mfussenegger/nvim-dap-python",
        dependencies = "mfussenegger/nvim-dap",
        config = function()
            -- uses the debugypy installation by mason
            local debugpyPythonPath = require("mason-registry").get_package("debugpy"):get_install_path()
                .. "/venv/bin/python3"

            require("dap-python").setup(debugpyPythonPath, {})

            -- local dap = require('dap')
            -- dap.adapters.python = {
            --     type = 'executable',
            --     command = 'python',
            --     args = { '-m', 'debugpy.adapter' },
            -- }
        end,
    },
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter",
            "nvim-neotest/neotest-python",
        },
        config = function()
            require("neotest").setup({
                adapters = {
                    require("neotest-python")({
                        dap = { stopOnEntry = false, justMyCode = false }
                    })
                }
            })
        end,
    },
}
