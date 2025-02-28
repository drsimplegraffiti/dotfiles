return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({
        ensure_installed = {"js-debug-adapter", "typescript-language-server", "gopls"}
      })
    end
  },{
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {"lua_ls", "ts_ls", "gopls"}
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({})
      lspconfig.ts_ls.setup({})

      -- GO lspconfig
          -- Golang LSP
      lspconfig.gopls.setup({
        cmd = {"gopls"},
        filetypes = {"go", "gomod", "gowork", "gotmpl"},
        settings = {
          gopls = {
            staticcheck = true,  -- Enable additional analysis
            gofumpt = true       -- Format using gofumpt
          }
        }
      })

      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
      vim.keymap.set({'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})
    end
  }
}
