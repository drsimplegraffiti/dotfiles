-- return 
--   {
--     "nvim-neo-tree/neo-tree.nvim",
--     branch = "v3.x",
--     dependencies = {
--       "nvim-lua/plenary.nvim",
--       "nvim-tree/nvim-web-devicons", 
--       "MunifTanjim/nui.nvim",
--     },
--     config = function()
--
--       -- SETUP NEOTREE FILE EXPLORER
--       -- vim.keymap.set('n', '<C-n>', ':Neotree filesystem reveal left<CR>', {})
--       vim.keymap.set('n', '<C-n>', ':Neotree toggle<CR>', {})
--     end
--
--   }

return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", 
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      filesystem = {
        filtered_items = {
          visible = true, -- Show hidden files
          hide_dotfiles = false, -- Don't hide dotfiles (.env, .gitignore)
          hide_gitignored = false, -- Don't hide .gitignore'd files
        },
      },
    })

    -- Toggle Neo-tree
    vim.keymap.set('n', '<C-n>', ':Neotree toggle<CR>', {})
  end
}

