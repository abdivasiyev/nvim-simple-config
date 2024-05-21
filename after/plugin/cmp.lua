local cmp = require('cmp')
local cmp_format = require('lsp-zero').cmp_format({details = true})
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
	preselect = 'item',
	completion = {
		completeopt = 'menu,menuone,noinsert'
	},
	sources = {
		{name = 'nvim_lsp'},
		{name = 'buffer'},
	},
	mapping = cmp.mapping.preset.insert({
		['<CR>'] = cmp.mapping.confirm({select = false}),
		['<Down>'] = cmp_action.luasnip_supertab(),
		['<Up>'] = cmp_action.luasnip_shift_supertab(),
	}),
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
	},
	formatting = cmp_format,
})
