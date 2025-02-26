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
    dap_virtual_text.setup()

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

    -- Go debugger setup
    require("dap-go").setup()
  end,
}

