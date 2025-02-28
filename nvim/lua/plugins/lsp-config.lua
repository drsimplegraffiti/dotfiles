-- return {
--   {
--     "williamboman/mason.nvim",
--     config = function()
--       require("mason").setup({
--         ensure_installed = {"js-debug-adapter", "typescript-language-server", "gopls"}
--       })
--     end
--   },{
--     "williamboman/mason-lspconfig.nvim",
--     config = function()
--       require("mason-lspconfig").setup({
--         ensure_installed = {"lua_ls", "ts_ls", "gopls"}
--       })
--     end
--   },
--   {
--     "neovim/nvim-lspconfig",
--     config = function()
--       local lspconfig = require("lspconfig")
--       lspconfig.lua_ls.setup({})
--       lspconfig.ts_ls.setup({})
--
--       -- GO lspconfig
--           -- Golang LSP
--       lspconfig.gopls.setup({
--         cmd = {"gopls"},
--         filetypes = {"go", "gomod", "gowork", "gotmpl"},
--         settings = {
--           gopls = {
--             staticcheck = true,  -- Enable additional analysis
--             gofumpt = true       -- Format using gofumpt
--           }
--         }
--       })
--
--       vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
--       vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
--       vim.keymap.set({'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})
--     end
--   }
-- }
--
--

return {
  -- Mason: Install and manage LSP servers
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },

  -- Mason-LSPConfig: Bridge between Mason and LSPConfig
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "ts_ls", "gopls" },
      })
    end,
  },

  -- LSPConfig: Configure LSP servers
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")

      -- Lua LSP
      lspconfig.lua_ls.setup({})

      -- TypeScript LSP
      lspconfig.ts_ls.setup({})

      -- Golang LSP
      lspconfig.gopls.setup({
        cmd = { "gopls" },
        filetypes = { "go", "gomod", "gowork", "gotmpl" },
        settings = {
          gopls = {
            staticcheck = true, -- Enable additional analysis
            gofumpt = true, -- Format using gofumpt
          },
        },
        on_attach = function(client, bufnr)
          -- Format on save
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({ async = false })
            end,
          })
        end,
      })

      -- Diagnostics Configuration
      vim.diagnostic.config({
        virtual_text = false, -- Disable inline error messages
        signs = true, -- Show error signs in the gutter
        underline = true, -- Underline lines with errors
        update_in_insert = false, -- Don't update diagnostics while typing
        severity_sort = true, -- Sort by severity
        float = {
          border = "rounded", -- Rounded border for popups
          source = "always", -- Show the error source
        },
      })

      -- Show diagnostics in a floating window on hover
      vim.api.nvim_create_autocmd("CursorHold", {
        callback = function()
          vim.diagnostic.open_float(nil, { focusable = false })
        end,
      })

      -- Keybindings for LSP features
      vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show Hover Information" })
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
      vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show Error Message" })
      vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous Diagnostic" })
      vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })
    end,
  },
}
