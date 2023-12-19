require("nvim-tree").setup({
    sort_by = "case_sensitive",
    view = {mappings = {list = {{key = "u", action = "dir_up"}}}},
    renderer = {
        group_empty = true,
        indent_markers = {enable = true, inline_arrows = false}
    },
    filters = {dotfiles = false},
    git = {ignore = false}
})

local function open_nvim_tree()

  -- open the tree
  require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
