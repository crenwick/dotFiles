-- debug.lua

return {
  'mfussenegger/nvim-dap',
  dependencies = {
    'rcarriga/nvim-dap-ui',
    'nvim-neotest/nvim-nio',
    -- virtual text for the debugger
    {
      'theHamsta/nvim-dap-virtual-text',
      opts = {},
    },
  },
  config = function()
    local dap = require 'dap'
    local dapui = require 'dapui'

    -- Basic debugging keymaps, feel free to change to your liking!
    vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint, { desc = 'Debug: Toggle Breakpoint' })
    vim.keymap.set('n', '<leader>gb', dap.run_to_cursor, { desc = 'Debug: Run To Cursor' })

    vim.keymap.set('n', '<F1>', dap.continue, { desc = 'Debug: Start/Continue' })
    vim.keymap.set('n', '<F2>', dap.step_into, { desc = 'Debug: Step Into' })
    vim.keymap.set('n', '<F3>', dap.step_over, { desc = 'Debug: Step Over' })
    vim.keymap.set('n', '<F4>', dap.step_out, { desc = 'Debug: Step Out' })
    vim.keymap.set('n', '<F5>', dap.step_back, { desc = 'Debug: Step Back' })
    vim.keymap.set('n', '<F6>', dap.restart, { desc = 'Debug: Restart' })

    -- Dap UI setup
    -- For more information, see |:help nvim-dap-ui|
    dapui.setup()

    -- Eval var under cursor
    vim.keymap.set('n', '<space>ge', function()
      require('dapui').eval(nil, { enter = true })
    end, { desc = 'Debug: Eval under cursor' })

    -- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
    vim.keymap.set('n', '<F7>', dapui.toggle, { desc = 'Debug: See last session result.' })

    dap.listeners.before.attach.dapui_config = dapui.open
    dap.listeners.before.launch.dapui_config = dapui.open
    dap.listeners.after.event_initialized.dapui_config = dapui.open
    dap.listeners.before.event_terminated.dapui_config = dapui.close
    dap.listeners.before.event_exited.dapui_config = dapui.close

    -- zig specific configuration
    dap.adapters.codelldb = {
      type = 'server',
      -- host = '127.0.0.1',
      port = '${port}',
      executable = {
        command = 'codelldb',
        args = { '--port', '${port}' },
      },
    }
    dap.configurations.zig = {
      {
        name = 'Launch',
        type = 'codelldb',
        request = 'launch',
        program = '${workspaceFolder}/zig-out/bin/${workspaceFolderBasename}',
        cwd = '${workspaceFolder}',
        terminal = 'integrated',
        stopOnEntry = false,
        args = { '/Users/charlol/Downloads/instructions.txt' },
        runInTerminal = true,
      },
    }
  end,
}
