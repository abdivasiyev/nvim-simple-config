vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.4', requires = { { 'nvim-lua/plenary.nvim' } }
	}
	use {
		'nvim-treesitter/nvim-treesitter',
		run = function()
			local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
			ts_update()
		end,
	}
	use 'tpope/vim-fugitive'
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
	use { "catppuccin/nvim", as = "catppuccin" }
	use 'github/copilot.vim'

	use {
		'pwntester/octo.nvim',
		requires = {
			'nvim-lua/plenary.nvim',
			'nvim-telescope/telescope.nvim',
			-- OR 'ibhagwan/fzf-lua',
			'nvim-tree/nvim-web-devicons',
		},
		config = function()
			require "octo".setup()
		end
	}
	use 'lewis6991/gitsigns.nvim'

	use {
		'ray-x/go.nvim',
		requires = {
			{ 'ray-x/guihua.lua' },
			{ 'neovim/nvim-lspconfig' },
			{ 'ray-x/guihua.lua' },
			{ 'nvim-treesitter/nvim-treesitter' },
		},
	}
	use 'mg979/vim-visual-multi'
	use 'wakatime/vim-wakatime'
end)
