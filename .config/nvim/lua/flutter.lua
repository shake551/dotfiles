require("flutter-tools").setup {
    decorations = {statusline = {app_version = true, device = true}},
    widget_guides = {enabled = true},
    outline = {open_cmd = "30vnew", auto_open = false},
    lsp = {color = {enabled = true}}
    -- debugger = {enabled = true, run_via_dap = true}
}

require("telescope").load_extension("flutter")
