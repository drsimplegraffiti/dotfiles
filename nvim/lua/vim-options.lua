vim.g.mapleader = " "
vim.g.maplocalleader = ""

-- split windows
vim.api.nvim_set_keymap("n", "<leader>sv", ":vsplit<CR>", { noremap = true, silent = true }) -- Split vertically
vim.api.nvim_set_keymap("n", "<leader>sh", ":split<CR>", { noremap = true, silent = true })  -- Split horizontally
vim.api.nvim_set_keymap("n", "<leader>sc", ":close<CR>", { noremap = true, silent = true }) -- Close current split

-- Navigating Between Splits
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", { noremap = true, silent = true }) -- Move left
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", { noremap = true, silent = true }) -- Move right
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", { noremap = true, silent = true }) -- Move down
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", { noremap = true, silent = true }) -- Move up


-- Resizing Splits
vim.api.nvim_set_keymap("n", "<C-Up>", ":resize +2<CR>", { noremap = true, silent = true })    -- Increase height
vim.api.nvim_set_keymap("n", "<C-Down>", ":resize -2<CR>", { noremap = true, silent = true })  -- Decrease height
vim.api.nvim_set_keymap("n", "<C-Left>", ":vertical resize -2<CR>", { noremap = true, silent = true }) -- Decrease width
vim.api.nvim_set_keymap("n", "<C-Right>", ":vertical resize +2<CR>", { noremap = true, silent = true }) -- Increase width




vim.opt.relativenumber = true -- or use vim.cmd("set relativenumber")
vim.opt.number = true         -- or use vim.cmd("set number")
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

vim.opt.smartindent = true -- Smart indentation
vim.opt.autoindent = true  -- Auto-indentation


vim.opt.mouse = 'a' -- enable mouse options

vim.api.nvim_set_keymap("i", "jk", "<Esc>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "jj", "<Esc>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "kj", "<Esc>", { noremap = true, silent = true })


-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true


-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
-- vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }


vim.api.nvim_create_autocmd("FileType", {
  pattern = "go",
  callback = function()
    vim.opt.tabstop = 4       -- Set tab width to 4 spaces (Go standard)
    vim.opt.shiftwidth = 4    -- Indentation width
    vim.opt.expandtab = false -- Use real tabs instead of spaces
  end
})

vim.opt.listchars = {
  tab = "  ",  -- Two spaces instead of `» `
  trail = "·",
  nbsp = "␣"
}



-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.setloclist, { desc = 'Show diagnotic [E]' })
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, {desc = "Go to previous [D]iagnostic message"})
vim.keymap.set('n', 'd]', vim.diagnostic.goto_prev, {desc = "Go to next [D]iagnostic message"})


-- Show which line your cursor is on
vim.opt.cursorline = true

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Search settings
vim.opt.hlsearch = true   -- Highlight all search results
vim.opt.incsearch = true  -- Incremental search as you type
vim.opt.ignorecase = true -- Ignore case when searching
vim.opt.smartcase = true  -- Case-sensitive if uppercase letters are used

-- Clipboard
-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

-- Performance
vim.opt.lazyredraw = true -- Faster scrolling
vim.opt.ttyfast = true    -- Improve performance
vim.opt.updatetime = 300  -- Reduce delay for CursorHold events

-- General settings
vim.opt.compatible = false  -- Disable compatibility with old vi
vim.cmd("syntax on")        -- Enable syntax highlighting
vim.opt.background = "dark" -- Set background to dark

-- Path and Completion
-- vim.opt.path:append("**") -- Recursive file search with :find
vim.opt.wildmenu = true -- Enable a more interactive completion menu


-- Spllit screen
vim.keymap.set("n", "<leader>s", ":vsp<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>h", ":sp<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>c", ":close<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>o", ":only<CR>", { noremap = true, silent = true })
