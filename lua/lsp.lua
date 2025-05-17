local cmp = require('cmp')
local keymap = vim.keymap.set
local capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.lsp.config.omnisharp =
{
	capabilities = capabilities,
    cmd = { '/home/souto/.local/bin/OmniSharp/OmniSharp', '-z', '--hostPID', '12345', 'DotNet:enablePackageRestore=false', '--encoding', 'utf-8', '--languageserver' },
	root_markers = { '.sln', '.csproj' },
	filetypes = { 'cs' },
	settings =
	{
		FormattingOptions = { EnableEditorConfigSupport = true },
		MsBuild = {},
		RenameOptions = {},
		RoslynExtensionsOptions = {},
		Sdk = { IncludePrereleases = true }
	}
}

vim.lsp.enable({ 'omnisharp' })

cmp.setup(
{
	sources = cmp.config.sources(
	{
		{ name = 'nvim_lsp' }
	},
	{
		{ name = 'buffer' }
	}),
	snippet =
	{
		expand = function(args)
			vim.snippet.expand(args.body)
		end
	},
	mapping = cmp.mapping.preset.insert({})
})

vim.api.nvim_create_autocmd('LspAttach',
{
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)

		if client:supports_method('textDocument/completion') then
			-- vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })

			local opts = { buffer = bufnr }

			keymap('n', 'sd', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
			keymap('n', '<F12>', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
			keymap('n', 'st', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
			keymap('n', 'sr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
			keymap('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
		end
	end
})
