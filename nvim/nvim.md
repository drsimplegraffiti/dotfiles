## Install Neovim
Go to [Check here](https://github.com/neovim/neovim/blob/master/INSTALL.md)
```bash
scoop bucket add main
scoop install neovim
```

### Install on Linux
```bash
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
```

Then 
```bash
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"
source ~/.bashrc   # If using Bash
source ~/.zshrc    # If using Zsh

```

### Check installation
```bash
nvim -v
```

### Setup init.lua file
Create nvim ~/.config/nvim/init.lua
```bash
mkdir -p ~/.config/nvim
nvim ~/.config/nvim/init.lua
```

### Init.lua
```bash
set expandtab
set tabstop=2
set softabstop=2
set shiftwidth=2
```
Then `:source %`

### Next install a package Manager
We are going for lazy loading. Add the follwoing to your init.lua 
```bash
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")


-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

local plugins = {}
local opts = {}

require("lazy").setup(plugins, opts)

```

Next, write `:w` and `source %`. On success, we have now have access to the `:Lazy`, we should see:

![Image description](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/ae7wa8qot463c3t0i2wm.png)

### install color scheme
https://github.com/catppuccin/nvim
And copy the Lazyvim

![Image description](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/zhcb334t5b9l8e62gjx9.png)

Then you should have:

![Image description](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/olze0xwgm85z35fxx1v0.png)

Note: this is not using catpuccin, to use it, you should require it


```bash
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")


-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  {"catppuccin/nvim", name = "catppuccin", priority = 1000}
}
local opts = {}

require("lazy").setup(plugins, opts)
require("catppuccin").setup()
vim.cmd.colorscheme "catppuccin"

```

### Add fuzzy finder
```bash
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")


-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- PLUGINS IMPORT
local plugins = {
  {"catppuccin/nvim", name = "catppuccin", priority = 1000},
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' }
  }
}
local opts = {}

require("lazy").setup(plugins, opts)

-- SETUP TELESCOPE
local builtin = require("telescope.builtin")
vim.keymap.set('n', '<C-p>', builtin.find_files, {})


-- SETUP COLOR SCHEME
require("catppuccin").setup()
vim.cmd.colorscheme "catppuccin"

```

You should have:

![Image description](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/cy3pr5iqmi9asoi241z9.png)


### Install Tree Sitter
```bash
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- PLUGINS IMPORT
local plugins = {
  {"catppuccin/nvim", name = "catppuccin", priority = 1000},
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"}
}
local opts = {}

require("lazy").setup(plugins, opts)

-- SETUP TELESCOPE
local builtin = require("telescope.builtin")
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})

-- TREE SITTER CONFIG
local config = require("nvim-treesitter.configs")
config.setup({
  ensure_installed = {"lua", "javascript"},
  highlight = {enable = true},
  indent = {enable = true},
})


-- SETUP COLOR SCHEME
require("catppuccin").setup()
vim.cmd.colorscheme "catppuccin"

```
Then you can do `:TSInstall` and `:TSUpdate`

NOTE: for tree-sitter error: 
```bash
sudo apt-get install build-essential 
```

### install LSP
Use Mason
```bash
williamboman/mason.nvim
```
This will give you access to `:Mason`

![Image description](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/gyp0brzw4agdkapra3u4.png)


### Mark vim as a global variable
Use telescope code action
![Image description](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/i7v7nrru1wg99w41aaz5.png)



### To install lsp type `:Mason`
scroll down and type `i`

e.g 

![Image description](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/20c5g0dnyr5ab7ottzpu.png)
Then add the mason `:Mason` to add prettier and eslint







