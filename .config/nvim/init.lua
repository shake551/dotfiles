require "plugins"
require "nvim_tree"
require "lsp"
require "comp"
require "ctr-char"
require "toggleterm"
require "git_status"

vim.wo.number = true
vim.opt.clipboard = "unnamedplus"

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true
vim.opt.pumblend = 20

vim.cmd "colorschem atom-dark"

