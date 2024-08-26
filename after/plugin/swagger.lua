require('swagger-preview').setup({
	port = 6575,
	host = 'localhost',
})


vim.keymap.set('n', '<leader>sw', '<cmd>SwaggerPreviewToggle<cr>')
