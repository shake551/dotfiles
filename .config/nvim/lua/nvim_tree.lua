require("nvim-tree").setup({
    open_on_setup = true,
    sort_by = "case_sensitive",
    view = {mappings = {list = {{key = "u", action = "dir_up"}}}},
    renderer = {
        group_empty = true,
        indent_markers = {enable = true, inline_arrows = false}
    },
    filters = {dotfiles = false},
    git = {ignore = false}
})
