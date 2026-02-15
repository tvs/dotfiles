-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
vim.g.mapleader = ","
vim.g.maplocalleader = "\\"

vim.opt.guifont = { "HackNerd", "h11" }

vim.opt.relativenumber = false

-- Spaces and Tabs
vim.opt.tabstop = 2 -- 2 space tab
vim.opt.softtabstop = 2 -- 2 space tab
vim.opt.shiftwidth = 2
vim.opt.expandtab = true -- Use spaces for tabs
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.modeline = true

-- UI Layout
vim.opt.cursorcolumn = false -- Don't highlight current column
vim.opt.cursorline = false -- Don't highlight current line
vim.opt.number = true -- Show line numbers
vim.opt.showmatch = true -- Highlight matching parenthesis
vim.opt.fillchars = "vert:|"

-- Searching
vim.opt.smartcase = true -- Ignore case when searching unless you add capitals
vim.opt.incsearch = true -- Search as characters are entered
vim.opt.hlsearch = true -- Highlight all matches

-- Folding
vim.opt.foldmethod = "indent" -- Fold based on indent level
vim.opt.foldnestmax = 10 -- Max depth of 10
vim.opt.foldenable = true -- Dont fold by default on open
vim.opt.foldlevelstart = 10 -- Start with a fold level of 10
