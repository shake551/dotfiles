return {
   "yetone/avante.nvim",
   dependencies = {
     "nvim-tree/nvim-web-devicons",
     "stevearc/dressing.nvim",
     "nvim-lua/plenary.nvim",
     "MunifTanjim/nui.nvim",
     {
       "MeanderingProgrammer/render-markdown.nvim",
       dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
       opts = { file_types = { "markdown", "Avante" } },
       ft = { "markdown", "Avante" },
     },
   },
   build = "make",
   opts = { provider = "copilot" },
}
