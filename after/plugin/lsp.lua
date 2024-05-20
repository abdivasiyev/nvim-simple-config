local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function (client, buffer)
	lsp_zero.default_keymaps({buffer = buffer})

	vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<cr>', {buffer = buffer})
end)

lsp_zero.set_sign_icons({
	error = '✘',
	warn = '▲',
	hint = '⚑',
	info = '»'
})

require('mason').setup {}
require('mason-lspconfig').setup {
	ensure_installed = {},
	handlers = {
		function(server_name)
			local lspconfig = require('lspconfig')
			lspconfig[server_name].setup {}
		end
	}
}

