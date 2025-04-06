vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function(use)
    use "wbthomason/packer.nvim"
    use "neovim/nvim-lspconfig"

    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'

    -- ok
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons' -- optional, for file icons
        },
	tag = 'latest'
    }

    -- auto close ex. {}
    -- ok
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

    -- ok
    use 'gosukiwi/vim-atom-dark'

    -- ok
    use 'akinsho/toggleterm.nvim'

    use {"fatih/vim-go", ft = {"go"}}

    -- ok
    use 'lewis6991/gitsigns.nvim'

    -- ok
    use {
        'nvim-lualine/lualine.nvim',
        requires = {'nvim-tree/nvim-web-devicons', opt = true}
    }

    -- ok
    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.4',
        requires = {{'nvim-lua/plenary.nvim'}, {'BurntSushi/ripgrep'}}
    }

    -- ok
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

    use {"jose-elias-alvarez/null-ls.nvim", requires = "nvim-lua/plenary.nvim"}

    -- ok
    use {"lukas-reineke/indent-blankline.nvim"}

    use {
        'akinsho/flutter-tools.nvim',
        requires = {
            'nvim-lua/plenary.nvim', 'stevearc/dressing.nvim' -- optional for vim.ui.select
        }
    }

    -- ok
    use {
        'pwntester/octo.nvim',
        requires = {
            'nvim-lua/plenary.nvim', 'nvim-telescope/telescope.nvim',
            'kyazdani42/nvim-web-devicons'
        }
    }

    -- ok
    use 'github/copilot.vim'

    -- ok
    use 'linrongbin16/gitlinker.nvim'

    -- ok
    use 'CopilotC-Nvim/CopilotChat.nvim'

    -- debugger
    use {
        "rcarriga/nvim-dap-ui",
        requires = {
            "mfussenegger/nvim-dap",
            "leoluz/nvim-dap-go",
            "nvim-treesitter/nvim-treesitter",
	    "nvim-neotest/nvim-nio"
        },
	config = function ()
                vim.fn.sign_define('DapBreakpoint', {text='⛔', texthl='', linehl='', numhl=''})
                vim.fn.sign_define('DapStopped', {text='👉', texthl='', linehl='', numhl=''})
                require('dapui').setup()
                require('dap-go').setup()
	end
    }
end)
