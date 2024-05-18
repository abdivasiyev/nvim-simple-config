local cmp = require('cmp')

cmp.setup({
	preselect = 'item',
	completion = {
		completeopt = 'menu,menuone,noinsert'
	},
	sources = {
		{name = 'nvim_lsp'},
	},
	mapping = {
		['<Enter>'] = cmp.mapping.confirm({select = false}),
		['<Esc>'] = cmp.mapping.abort(),
		['<S-Tab>'] = cmp.mapping.select_prev_item({behavior = 'select'}),
		['<Tab>'] = cmp.mapping.select_next_item({behavior = 'select'}),
		['<Up>'] = cmp.mapping(function()
			if cmp.visible() then
				cmp.select_prev_item({behavior = 'insert'})
			else
				cmp.complete()
			end
		end),
		['<Down>'] = cmp.mapping(function()
			if cmp.visible() then
				cmp.select_next_item({behavior = 'insert'})
			else
				cmp.complete()
			end
		end),
	},
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
	},
})
