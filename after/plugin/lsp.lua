local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, buffer)
	lsp_zero.default_keymaps({ buffer = buffer })

	vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<cr>', { buffer = buffer })
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
			lspconfig[server_name].setup {
				settings = {
					gopls = {
						gofumpt = true,
						codelenses = {
							gc_details = true,
							generate = true,
							regenerate_cgo = true,
							run_govulncheck = true,
							test = true,
							tidy = true,
							upgrade_dependency = true,
							vendor = true,
						},
						hints = {
							assignVariableTypes = true,
							compositeLiteralFields = true,
							compositeLiteralTypes = true,
							constantValues = true,
							functionTypeParameters = true,
							parameterNames = true,
							rangeVariableTypes = true,
						},
						analyses = {
							fieldalignment = true,
							nilness = true,
							unusedparams = true,
							unusedwrite = true,
							useany = true,
						},
						usePlaceholders = true,
						completeUnimported = true,
						staticcheck = true,
						directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
						semanticTokens = true,
					}
				}
			}
		end
	}
}
