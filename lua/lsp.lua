local keymap = vim.keymap.set

vim.lsp.config.omnisharp =
{
	capabilities = { workspace = { workspaceFolders = false } },
    cmd = { 'dotnet', '/home/souto/.local/bin/OmniSharp/OmniSharp.dll', '--languageserver' },
	root_markers = { '.sln', '.csproj' },
	filetypes = { 'cs', 'vb' }
}

vim.lsp.enable({ 'omnisharp' })

vim.api.nvim_create_autocmd('LspAttach',
{
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)

		if client:supports_method('textDocument/completion') then
			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })

			local opts = { buffer = bufnr }

			keymap('n', 'sd', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
			keymap('n', '<F12>', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
			keymap('n', 'st', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
			keymap('n', 'sr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
			keymap('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
		end
	end
})
