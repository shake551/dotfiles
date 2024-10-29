require("nvim-tree").setup({
    --open_on_setup = true,
    sort_by = "case_sensitive",
    renderer = {group_empty = true},
    filters = {dotfiles = false},
    git = {ignore = false},
    view = { width = 50 }
})

local function open_nvim_tree()

  -- open the tree
  require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
