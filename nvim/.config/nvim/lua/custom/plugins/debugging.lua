local ui = {
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
}

local python = -- Configuration for the python debugger
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
  }

return {
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      ui,
      python,
    },
    keys = function(_, keys)
      local dap = require 'dap'
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
        unpack(keys),
      }
    end,
    config = function()
      local dap = require 'dap'
      local dapui = require 'dapui'

      dap.listeners.after.event_initialized['dapui_config'] = dapui.open
      dap.listeners.before.event_terminated['dapui_config'] = dapui.close
      dap.listeners.before.event_exited['dapui_config'] = dapui.close
    end,
  },
  {
    'nvim-neotest/neotest',
    event = 'VeryLazy',
    dependencies = {
      'nvim-neotest/nvim-nio',
      'nvim-lua/plenary.nvim',
      'antoinemadec/FixCursorHold.nvim',
      'nvim-treesitter/nvim-treesitter',
      'nvim-neotest/neotest-python',
    },
    config = function()
      local virtual = os.getenv 'VIRTUAL_ENV' or os.getenv 'CONDA_PREFIX' or '/usr'
      print(virtual)
      require('neotest').setup {
        adapters = {
          require 'neotest-python' {
            dap = { stopOnEntry = false, justMyCode = false },
            python = virtual .. '/bin/python/',
          },
        },
      }
    end,
  },
}
