return {
        'akinsho/flutter-tools.nvim',
	dependencies = {
            'nvim-lua/plenary.nvim', 'stevearc/dressing.nvim'
        },
	opts = {
          decorations = {statusline = {device = false}},
          widget_guides = {enabled = true},
          outline = {open_cmd = "30vnew", auto_open = false},
          fvm = true,
	}
}
