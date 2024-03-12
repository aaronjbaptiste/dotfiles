-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local util = require("config.util")

util.cowboy()

local keymap = vim.keymap
local opts = {noremap = true, silent = true}

-- disable arrow keys
keymap.set("n", "<Up>", "<Nop>", opts)
keymap.set("n", "<Down>", "<Nop>", opts)
keymap.set("n", "<Left>", "<Nop>", opts)
keymap.set("n", "<Right>", "<Nop>", opts)

-- allow pasting from system clipboard using yank etc
vim.opt.clipboard:append { 'unnamed', 'unnamedplus' }
