vim.g.mapleader = " "

local opt = vim.opt

opt.relativenumber = true -- show relative line numbers
opt.number = true -- shows absolute line number on cursor line (when relative number is on)

-- tabs & indentation
opt.tabstop = 2 -- 2 spaces for tabs
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- start new line at current indent

opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom
