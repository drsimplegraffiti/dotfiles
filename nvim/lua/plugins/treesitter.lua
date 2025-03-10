return {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate",
  config = function()

    -- TREE SITTER CONFIG
    local config = require("nvim-treesitter.configs")
    config.setup({
     -- ensure_installed = {"lua", "javascript"},
      auto_install = true,
      highlight = {enable = true},
      indent = {enable = true},
    })
  end
}
