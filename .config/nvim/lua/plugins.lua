vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use "wbthomason/packer.nvim"
	use "neovim/nvim-lspconfig"

	use 'williamboman/mason.nvim'
	use 'williamboman/mason-lspconfig.nvim'

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

	use { "fatih/vim-go", ft = { "go" } }

	use 'lewis6991/gitsigns.nvim'

	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'nvim-tree/nvim-web-devicons', opt = true }
	}

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		requires = { {'nvim-lua/plenary.nvim'}, {'BurntSushi/ripgrep'} }
	}

	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate',
	}

	use{
		"jose-elias-alvarez/null-ls.nvim",
		requires = "nvim-lua/plenary.nvim"
	}

	use "lukas-reineke/indent-blankline.nvim"

	use {
		'akinsho/flutter-tools.nvim',
		requires = {
			'nvim-lua/plenary.nvim',
			'stevearc/dressing.nvim', -- optional for vim.ui.select
		},
	}
end)
