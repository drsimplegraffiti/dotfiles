return {
  'stevearc/oil.nvim',
  opts = {}, -- Empty options table for Oil

  config = function()
    require('oil').setup()  -- Initialize the plugin
    vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" }) -- Set keybinding
  end,
}

