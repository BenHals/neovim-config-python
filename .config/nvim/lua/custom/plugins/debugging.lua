return {
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      -- Creates a beautiful debugger UI
      'rcarriga/nvim-dap-ui',

      -- Required dependency for nvim-dap-ui
      'nvim-neotest/nvim-nio',

      -- Installs the debug adapters for you
      'williamboman/mason.nvim',
      'jay-babu/mason-nvim-dap.nvim',

      -- Add your own debuggers here
      'mfussenegger/nvim-dap-python',
    },
    keys = function(_, keys)
      local dap = require 'dap'
      local dapui = require 'dapui'
      return {
        -- Basic debugging keymaps, feel free to change to your liking!
        { '<leader>dc', dap.continue, desc = 'Debug: Start/Continue' },
        { '<leader>di', dap.step_into, desc = 'Debug: Step Into' },
        { '<leader>dn', dap.step_over, desc = 'Debug: Step Over' },
        { '<leader>do', dap.step_out, desc = 'Debug: Step Out' },
        { '<leader>db', dap.toggle_breakpoint, desc = 'Debug: Toggle Breakpoint' },
        {
          '<leader>dB',
          function()
            dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
          end,
          desc = 'Debug: Set Breakpoint',
        },
        -- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
        { '<leader>ds', dapui.toggle, desc = 'Debug: See last session result.' },
        unpack(keys),
      }
    end,
    config = function()
      local dap = require 'dap'
      local dapui = require 'dapui'

      require('mason-nvim-dap').setup {
        -- Makes a best effort to setup the various debuggers with
        -- reasonable debug configurations
        automatic_installation = true,

        -- You can provide additional configuration to the handlers,
        -- see mason-nvim-dap README for more information
        handlers = {},

        -- You'll need to check that you have the required things installed
        -- online, please don't ask me how to install them :)
        ensure_installed = {},
      }

      dap.listeners.after.event_initialized['dapui_config'] = dapui.open
      dap.listeners.before.event_terminated['dapui_config'] = dapui.close
      dap.listeners.before.event_exited['dapui_config'] = dapui.close
    end,
  },
  {
    -- UI for the debugger
    -- - the debugger UI is also automatically opened when starting/stopping the debugger
    -- - toggle debugger UI manually with `<leader>du`
    {
      'rcarriga/nvim-dap-ui',
      keys = {
        {
          '<leader>du',
          function()
            require('dapui').toggle()
          end,
          silent = true,
        },
      },
      opts = {
        icons = { expanded = '∩â¥', collapsed = '∩âÜ', circular = '∩äÉ' },
        mappings = {
          expand = { '<CR>', '<2-LeftMouse>' },
          open = 'o',
          remove = 'd',
          edit = 'e',
          repl = 'r',
          toggle = 't',
        },
        layouts = {
          {
            elements = {
              { id = 'repl', size = 0.30 },
              { id = 'console', size = 0.70 },
            },
            size = 0.19,
            position = 'bottom',
          },
          {
            elements = {
              { id = 'scopes', size = 0.30 },
              { id = 'breakpoints', size = 0.20 },
              { id = 'stacks', size = 0.10 },
              { id = 'watches', size = 0.30 },
            },
            size = 0.20,
            position = 'right',
          },
        },
        controls = {
          enabled = true,
          element = 'repl',
          icons = {
            pause = 'ε½æ',
            play = 'ε½ô',
            step_into = 'ε½ö',
            step_over = 'ε½û ',
            step_out = 'ε½ò',
            step_back = 'ε«Å ',
            run_last = 'ε¼╖ ',
            terminate = 'ε½ù ',
          },
        },
        floating = {
          max_height = 0.9,
          max_width = 0.5,
          border = vim.g.border_chars,
          mappings = {
            close = { 'q', '<Esc>' },
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
        require('dapui').setup(opts)
      end,
    },
  },
  -- Configuration for the python debugger
  -- - configures debugpy for us
  -- - uses the debugpy installation from mason
  {
    'mfussenegger/nvim-dap-python',
    dependencies = 'mfussenegger/nvim-dap',
    config = function()
      -- uses the debugypy installation by mason
      local debugpyPythonPath = 'python'

      require('dap-python').setup(debugpyPythonPath, {})
      table.insert(require('dap').configurations.python, {
        type = 'python',
        request = 'attach',
        name = 'Attach remote JMC',
        connect = function()
          local host = vim.fn.input 'Host [127.0.0.1]: '
          host = host ~= '' and host or '127.0.0.1'
          local port = tonumber(vim.fn.input 'Port [5678]: ') or 5678
          local justMyCode = true
          return { host = host, port = port, justMyCode = justMyCode }
        end,
      })
    end,
  },
  {
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-neotest/nvim-nio',
      'nvim-lua/plenary.nvim',
      'antoinemadec/FixCursorHold.nvim',
      'nvim-treesitter/nvim-treesitter',
      'nvim-neotest/neotest-python',
    },
    config = function()
      require('neotest').setup {
        adapters = {
          require 'neotest-python' {
            dap = { stopOnEntry = false, justMyCode = false },
          },
        },
      }
    end,
  },
}
