vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
	use {
		'nvim-telescope/telescope.nvim', requires = {
		{ 'nvim-lua/plenary.nvim' },
		{ 'jonarrien/telescope-cmdline.nvim' },
		{ 'nvim-telescope/telescope-file-browser.nvim' },
	}
	}
	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
			'kyazdani42/nvim-web-devicons'
		},
	}
	use {
		'nvim-treesitter/nvim-treesitter',
		run = function()
			local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
			ts_update()
		end,
	}
	use { 'j-hui/fidget.nvim', tag = 'legacy' }
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		requires = {
			{ 'williamboman/mason.nvim' },
			{ 'williamboman/mason-lspconfig.nvim' },

			{ 'neovim/nvim-lspconfig' },
			{ 'hrsh7th/nvim-cmp' },
			{ 'hrsh7th/cmp-nvim-lsp' },
			{ 'L3MON4D3/LuaSnip' },
		}
	}
	use 'mbbill/undotree'
	use 'github/copilot.vim'
	use 'lewis6991/gitsigns.nvim'
	use 'mg979/vim-visual-multi'
	use 'wakatime/vim-wakatime'
	use {
		"rcarriga/nvim-dap-ui",
		requires = {
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio",
			"leoluz/nvim-dap-go",
		},
	}
	use 'tpope/vim-fugitive'
	use { 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async' }

	use "rebelot/kanagawa.nvim"

	use {
		'gelguy/wilder.nvim',
		config = function()
		end,
	}
	use {
		'kawre/leetcode.nvim',
		requires = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
		}
	}
end)
