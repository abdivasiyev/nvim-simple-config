-- Open pdf files in the default pdf viewer
vim.api.nvim_create_autocmd("BufReadCmd", {
	pattern = "*.pdf",
	callback = function()
		local filename = vim.fn.shellescape(vim.api.nvim_buf_get_name(0))
		vim.cmd("silent !open " .. filename .. " &")
		vim.cmd("let tobedeleted = bufnr('%') | b# | exe \"bd! \" . tobedeleted")
	end
})

-- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
	pattern = "*",
	callback = function()
		vim.highlight.on_yank { higroup = "IncSearch", timeout = 250 }
	end,
})

-- Auto format packages
-- local format_sync_grp = vim.api.nvim_create_augroup("AutoFormat", {})
-- vim.api.nvim_create_autocmd("BufWritePre", {
-- 	pattern = "*.go",
-- 	callback = function()
-- 		local params = vim.lsp.util.make_range_params()
-- 		params.context = { only = { "source.organizeImports" } }
-- 		local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
-- 		for cid, res in pairs(result or {}) do
-- 			for _, r in pairs(res.result or {}) do
-- 				if r.edit then
-- 					local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
-- 					vim.lsp.util.apply_workspace_edit(r.edit, enc)
-- 				end
-- 			end
-- 		end
-- 		vim.lsp.buf.format({ async = false })
-- 	end,
-- 	group = format_sync_grp,
-- })
