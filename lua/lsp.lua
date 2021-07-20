local lspconfig = require('lspconfig')
local servers = vim.g.peafowl_lsp_list

for _, lsp_name in ipairs(servers) do
	local lsp = lspconfig[lsp_name]

	if not lsp then
		print("Unknown LSP: " .. lsp_name)
		return
	end

	lsp.setup({})
end

