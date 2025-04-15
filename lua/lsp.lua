local lsp_zero = require('lsp-zero')
local lsp_config = require('lspconfig')
local cmp = require('cmp')
local keymap = vim.keymap.set

function lsp_attach(client, bufnr)
	local opts = { buffer = bufnr }

	keymap('n', 'sd', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
	keymap('i', '<C-s>', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
	keymap('n', '<F12>', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
	keymap('n', 'st', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
	keymap('n', 'sr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
	keymap('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)

	if client.server_capabilities.signatureHelpProvider then
		require('lsp-overloads').setup(client,
		{
			keymaps =
			{
				next_signature = "<Down>",
				previous_signature = "<Up>",
				next_parameter = "<Right>",
				previous_parameter = "<Left>",
				close_signature = "q"
			},
			display_automatically = false
		})
		keymap('i', '<C-d>', "<cmd>:LspOverloadsSignature<cr>", opts)
	end
end

lsp_zero.extend_lspconfig(
{
	sign_text = false,
	lsp_attach = lsp_attach,
	capabilities = require('cmp_nvim_lsp').default_capabilities()
})

lsp_config.omnisharp.setup(
{
    cmd = { "dotnet", '/home/souto/.local/bin/OmniSharp/OmniSharp.dll' }
})

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
