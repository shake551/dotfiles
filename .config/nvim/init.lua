--require "plugins"
--require "nvim_tree"
--require "lsp"
--require "comp"
--require "ctr-char"
--require "toggleterm"
--require "git_status"
--require "status_line"
--require "ff"
--require "nvim_treesitter"
--require "formatter"
--require "indent"
--require "flutter"
--require "octo_config"
--require "git_link"
--require "copilot"
require("config.lazy")
require("config.options")
require("config.keymaps")


vim.wo.number = true
vim.opt.clipboard = "unnamedplus"

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true
vim.opt.pumblend = 20

if vim.fn.argc(-1) == 0 then
  vim.cmd("NvimTreeOpen")
end

--vim.cmd('colorscheme atom-dark')
