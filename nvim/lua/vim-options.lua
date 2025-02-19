vim.cmd("set relativenumber")
vim.cmd("set number")
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "


vim.opt.smartindent = true      -- Smart indentation
vim.opt.autoindent = true       -- Auto-indentation


vim.api.nvim_set_keymap("i", "jk", "<Esc>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "jj", "<Esc>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "kj", "<Esc>", { noremap = true, silent = true })



-- Search settings
vim.opt.hlsearch = true    -- Highlight all search results
vim.opt.incsearch = true   -- Incremental search as you type
vim.opt.ignorecase = true  -- Ignore case when searching
vim.opt.smartcase = true   -- Case-sensitive if uppercase letters are used

-- Clipboard
vim.opt.clipboard = "unnamedplus" -- Use system clipboard

-- Performance
vim.opt.lazyredraw = true  -- Faster scrolling
vim.opt.ttyfast = true     -- Improve performance
vim.opt.updatetime = 300   -- Reduce delay for CursorHold events

-- General settings
vim.opt.compatible = false -- Disable compatibility with old vi
vim.cmd("syntax on")       -- Enable syntax highlighting
vim.opt.background = "dark" -- Set background to dark

-- Path and Completion
-- vim.opt.path:append("**") -- Recursive file search with :find
vim.opt.wildmenu = true   -- Enable a more interactive completion menu
