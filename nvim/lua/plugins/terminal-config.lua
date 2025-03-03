return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup{
        size = function(term)
          if term.direction == "horizontal" then
            return 15
          elseif term.direction == "vertical" then
            return vim.o.columns * 0.4
          end
        end,
        open_mapping = [[<C-t>]], -- Press Ctrl + t to toggle
        shade_terminals = true,
        shading_factor = 2,
        start_in_insert = true,
        persist_size = true,
        direction = "float", -- Floating terminal
        close_on_exit = true,
        shell = vim.o.shell,
        float_opts = {
          border = "curved", -- Options: single, double, shadow, curved
          winblend = 3,
          highlights = {
            border = "Normal",
            background = "Normal",
          },
        },
      }

      -- Keybindings
      vim.api.nvim_set_keymap("n", "<leader>tt", "<cmd>ToggleTerm direction=float<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("t", "<C-w>h", "<C-\\><C-n><C-w>h", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("t", "<C-w>l", "<C-\\><C-n><C-w>l", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("t", "<C-w>j", "<C-\\><C-n><C-w>j", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("t", "<C-w>k", "<C-\\><C-n><C-w>k", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("t", "<C-q>", "<C-\\><C-n>:q<CR>", { noremap = true, silent = true })
    end
  }
}

