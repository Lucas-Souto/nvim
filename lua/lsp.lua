local lsp_zero = require('lsp-zero')
local lsp_config = require('lspconfig')
local cmp = require('cmp')
local keymap = vim.keymap.set

function lsp_attach(client, bufnr)
	local opts = { buffer = bufnr }

	keymap('n', 'sd', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
	keymap('n', '<F12>', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
	keymap('n', 'st', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
	keymap('n', 'sr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
	keymap('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
end

lsp_zero.extend_lspconfig(
{
	sign_text = false,
	lsp_attach = lsp_attach,
	capabilities = require('cmp_nvim_lsp').default_capabilities()
})

local css_capabilities = vim.lsp.protocol.make_client_capabilities()
css_capabilities.textDocument.completion.completionItem.snippetSupport = true

lsp_config.css_variables.setup({})
lsp_config.cssls.setup({ capabilities = css_capabilities })
lsp_config.eslint.setup({})

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
