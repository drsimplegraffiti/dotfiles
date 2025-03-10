return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui", -- UI for nvim-dap
    "leoluz/nvim-dap-go",    -- Debug adapter for Go
    "theHamsta/nvim-dap-virtual-text", -- Virtual text for inline debugging
    "nvim-neotest/nvim-nio", -- Required dependency for nvim-dap-ui
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")
    local dap_virtual_text = require("nvim-dap-virtual-text")

    -- Setup virtual text
    dap_virtual_text.setup({
      opts = {virt_text_pos = 'eol'}
    })

    -- Setup Node adapter
    dap.adapters["pwa-node"] = {
      type = "server",
      host = "127.0.0.1",
      port = 8123,
      executable = {
        command = "js-debug-adapter",
      }
    }

    for _, language in ipairs {"typescript", "javascript"} do
      dap.configurations[language] = {
        {
          type = "pwa-node",
          request = "launch",
          name = "${file}",
          cwd = "${workspaceFolder}",
          runtimeExecutable = "node",
        },
         {
            type = "pwa-node",
            request = "launch",
            name = "Launch file",
            program = "${file}",
            cwd = vim.fn.getcwd(),
            sourceMaps = true,
          },
          -- Debug nodejs processes (make sure to add --inspect when you run the process)
          {
            type = "pwa-node",
            request = "attach",
            name = "Attach",
            processId = require("dap.utils").pick_process,
            cwd = vim.fn.getcwd(),
            sourceMaps = true,
          },
      }
    end

    -- Setup DAP UI
    dapui.setup()

    -- Open DAP UI automatically on debugging events
    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end

    -- Setup icons for breakpoints, stopped position, etc.
    vim.fn.sign_define("DapBreakpoint", { text = "🔴", texthl = "Error", linehl = "", numhl = "" })
    vim.fn.sign_define("DapStopped", { text = "🟢", texthl = "Success", linehl = "", numhl = "" })
    vim.fn.sign_define("DapBreakpointCondition", { text = "🟡", texthl = "Warning", linehl = "", numhl = "" })
    vim.fn.sign_define("DapLogPoint", { text = "📝", texthl = "Debug", linehl = "", numhl = "" })

    -- Key mappings for DAP
    vim.keymap.set("n", "<Leader>dt", function() dap.toggle_breakpoint() end, { desc = "Toggle Breakpoint" })
    vim.keymap.set("n", "<Leader>dc", function() dap.continue() end, { desc = "Start/Continue Debugging" })
    vim.keymap.set("n", "<Leader>do", function() dap.step_over() end, { desc = "Step Over" })
    vim.keymap.set("n", "<Leader>di", function() dap.step_into() end, { desc = "Step Into" })
    vim.keymap.set("n", "<Leader>du", function() dap.step_out() end, { desc = "Step Out" })
    vim.keymap.set("n", "<Leader>dr", function() dap.repl.open() end, { desc = "Open REPL" })
    vim.keymap.set("n", "<Leader>dl", function() dap.run_last() end, { desc = "Run Last Debugging Session" })
    vim.keymap.set("n", "<Leader>dx", function() dap.terminate() end, { desc = "Terminate Debugging" })

    vim.keymap.set("n", "<leader>ds", function()
      require('dap').terminate()
      require('dapui').close()
      require('dap').repl.close()
      vim.defer_fn(function()
        require('dapui').open()
      end, 100)  -- Ensure a slight delay before reopening UI
    end, { desc = "Reset the debugger" })


    -- Go debugger setup
    require("dap-go").setup()
  end,
}




