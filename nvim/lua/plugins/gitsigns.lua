-- return {
--   {
--     "tpope/vim-fugitive",
--   },
--   {
--     "lewis6991/gitsigns.nvim",
--     config = function()
--       require("gitsigns").setup()
--     end,
--   }
-- }
--

-- return {
--   {
--     "tpope/vim-fugitive"
--   },
--   {
--     "lewis6991/gitsigns.nvim",
--     config = function()
--       require("gitsigns").setup()
--
--       vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", {})
--       vim.keymap.set("n", "<leader>gt", ":Gitsigns toggle_current_line_blame<CR>", {})
--     end
--   }
-- }
--
return {
  {
    "tpope/vim-fugitive"
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()

      -- Gitsigns key mappings
      vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", {})
      vim.keymap.set("n", "<leader>gt", ":Gitsigns toggle_current_line_blame<CR>", {})
      vim.keymap.set("n", "<leader>gr", ":Gitsigns reset_hunk<CR>", {})
      vim.keymap.set("n", "<leader>gR", ":Gitsigns reset_buffer<CR>", {})
      vim.keymap.set("n", "<leader>gs", ":Gitsigns stage_hunk<CR>", {})
      vim.keymap.set("n", "<leader>gu", ":Gitsigns undo_stage_hunk<CR>", {})
      vim.keymap.set("n", "<leader>gn", ":Gitsigns next_hunk<CR>", {})
      vim.keymap.set("n", "<leader>gN", ":Gitsigns prev_hunk<CR>", {})

      -- Fugitive key mappings
      vim.keymap.set("n", "<leader>ga", ":Git add .<CR>", {})
      vim.keymap.set("n", "<leader>gc", ":Git commit<CR>", {})
      vim.keymap.set("n", "<leader>gp", ":Git push<CR>", {})
      vim.keymap.set("n", "<leader>gP", ":Git pull<CR>", {})
      vim.keymap.set("n", "<leader>gd", ":Gdiffsplit<CR>", {})
      vim.keymap.set("n", "<leader>gb", ":Git blame<CR>", {})
      vim.keymap.set("n", "<leader>gl", ":Git log<CR>", {})
    end
  }
}

