vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use { "wbthomason/packer.nvim", opt = true }
	use "neovim/nvim-lspconfig"

	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
			'kyazdani42/nvim-web-devicons', -- optional, for file icons
		},
		tag = 'nightly' -- optional, updated every week. (see issue #1193)
	}

	-- auto close ex. {}
	use {
		"windwp/nvim-autopairs",
		config = function() require("nvim-autopairs").setup {} end
	}

	use 'wakatime/vim-wakatime'

	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/nvim-cmp'
	
	use 'L3MON4D3/LuaSnip'
	use 'saadparwaiz1/cmp_luasnip'

	use 'gosukiwi/vim-atom-dark'

	use 'akinsho/toggleterm.nvim'

	use { "fatih/vim-go", opt = true, ft = { "go" } }
end)
