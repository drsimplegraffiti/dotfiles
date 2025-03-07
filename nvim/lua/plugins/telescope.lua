-- return {
--   {
--     'nvim-telescope/telescope.nvim', tag = '0.1.8',
--     dependencies = { 'nvim-lua/plenary.nvim' },
--
--     config = function()
--       -- SETUP TELESCOPE
--       local builtin = require("telescope.builtin")
--
--       vim.keymap.set('n', '<C-p>', builtin.find_files, {})
--       vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
--     end
--   },{
--
--     "nvim-telescope/telescope-ui-select.nvim",
--     config = function()
--       require("telescope").setup({
--
--         extensions = {
--           ["ui-select"] = {
--             require("telescope.themes").get_dropdown {
--             }
--           }
--         }
--       })
--       require("telescope").load_extension("ui-select")
--     end
--   },
--
-- }
--
--
--
--
return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-fzf-native.nvim", -- Fuzzy finder for speed
    },

    config = function()
      local telescope = require("telescope")
      local builtin = require("telescope.builtin")

      telescope.setup({
        defaults = {
          layout_strategy = "horizontal",
          layout_config = { prompt_position = "top" },
          sorting_strategy = "ascending",
          file_ignore_patterns = { "node_modules", ".git", "target", "dist" },
          path_display = { "truncate" },
          mappings = {
            i = { ["<C-u>"] = false, ["<C-d>"] = false }, -- Faster navigation
          },
        },
        pickers = {
          find_files = { hidden = true, previewer = false }, -- Hide preview for speed
          live_grep = { previewer = false },
        },
        extensions = {
          ["ui-select"] = { require("telescope.themes").get_dropdown({}) },
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          },
        },
      })

      -- Load extensions
      telescope.load_extension("fzf")
      telescope.load_extension("ui-select")

      -- Keybindings
      vim.keymap.set("n", "<C-p>", builtin.find_files, { silent = true })
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, { silent = true })
    end,
  },

  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make", -- Ensure it's built for max performance
  },

  {
    "nvim-telescope/telescope-ui-select.nvim",
  },
}

