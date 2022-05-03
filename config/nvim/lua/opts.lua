-- Custom neovim configurations and sets
local set = vim.opt
local g = vim.g

-- Numbers
set.number = true
set.relativenumber = true

-- GUIS
set.termguicolors = true
set.guicursor = ""
set.cursorline = true
set.pumheight = 5
set.hlsearch = false
set.wrap = false
set.wildmenu = true
set.wildmode = { "list:longest" }
set.smartcase = true
set.signcolumn = "yes"

set.expandtab = true
set.tabstop = 2
set.softtabstop = 2
set.shiftwidth = 2
set.path = "**"
set.autoindent = true
