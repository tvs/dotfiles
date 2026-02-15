-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
-- Navigate softwrapped lines (allow jumps correctly)
vim.keymap.set({ "n", "v" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })
vim.keymap.set({ "n", "v" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })

-- Toggle Line Number
vim.keymap.set({ "n" }, "<leader>1", ":set number!<CR>") -- Toggle line numbers
vim.keymap.set({ "n" }, "<leader>2", ":set relativenumber!<CR>") -- Toggle relative line numbers
vim.keymap.set({ "n" }, "<leader><space>", ":noh<CR>") -- Disable search highlights

-- File Shortcuts
vim.keymap.set({ "n" }, "<leader>eb", ":tabe ~/.zshrc<CR>") -- Edit terminal profile
vim.keymap.set({ "n" }, "<leader>ev", ":Tex ~/.config/nvim/<CR>") -- Edit vim profile
vim.keymap.set({ "n" }, "<leader>sv", ":source $MYVIMRC<CR>") -- Source vim profile

-- Copy to Clipboard
vim.keymap.set({ "v" }, "<leader>y", '"+y')
