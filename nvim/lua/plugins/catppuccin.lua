-- return {
--   "catppuccin/nvim",
--   lazy = false,
--   name = "catppuccin",
--   priority = 1000,
--   config = function()
--     vim.cmd.colorscheme "catppuccin" 
--   end
-- }

-- return {
--   "sainnhe/everforest",
--   priority = 1000,
--   config = function()
--     vim.cmd.colorscheme "everforest"
--   end
-- }


return {
    "tiagovla/tokyodark.nvim",
    opts = {
        -- Custom options (optional)
        transparent_background = true,  -- Set true for transparency
        gamma = 1.0,  -- Adjust brightness (default: 1.0)
        italic_comments = true,  -- Enable italic comments
    },
    config = function(_, opts)
        require("tokyodark").setup(opts)  -- Optional setup call
        vim.cmd [[colorscheme tokyodark]]
    end,
}

