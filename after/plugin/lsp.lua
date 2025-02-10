local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, buffer)
	lsp_zero.default_keymaps({ buffer = buffer })

	vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<cr>', { buffer = buffer })
	vim.keymap.set('n', 'gi', '<cmd>Telescope lsp_implementations<cr>', { buffer = buffer })
	vim.keymap.set('n', 'gd', '<cmd>Telescope lsp_definitions<cr>', { buffer = buffer })
	vim.keymap.set('n', '<leader>d', '<cmd>Telescope diagnostics<cr>', { buffer = buffer })
end)

lsp_zero.set_sign_icons({
	error = '✘',
	warn = '▲',
	hint = '⚑',
	info = '»'
})

-- highlight symbol under cursor
vim.opt.updatetime = 300
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(event)
    local id = vim.tbl_get(event, 'data', 'client_id')
    local client = id and vim.lsp.get_client_by_id(id)
    if client == nil then
      return
    end

    lsp_zero.highlight_symbol(client, bufnr)
  end
})

require('mason').setup {}
require('mason-lspconfig').setup {
	ensure_installed = {},
	handlers = {
		function(server_name)
			local lspconfig = require('lspconfig')
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			capabilities.textDocument.foldingRange = {
				dynamicRegistration = false,
				lineFoldingOnly = true
			}

			lspconfig[server_name].setup {
				capabilities = capabilities,
				settings = {
					gopls = {
						gofumpt = false,
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
							nilness = true,
							unusedparams = true,
							unusedwrite = true,
							useany = true,
							shadow = true,
							unusedvariable = true,
						},
						usePlaceholders = true,
						completeUnimported = true,
						staticcheck = true,
						directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
						semanticTokens = true,
					},
				}
			}
		end
	}
}
