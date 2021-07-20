local lspconfig = require('lspconfig')
local servers = vim.g.peafowl_lsp_list

vim.lsp.set_log_level("debug")

for _, lsp_name in ipairs(servers) do
	local lsp = lspconfig[lsp_name]

	if not lsp then
		print("Unknown LSP: " .. lsp_name)
		return
	end

	if lsp_name == "sumneko_lua" then
		lsp.setup({
			cmd = { vim.g.peafowl_lua_lsp_location, '-E', vim.g.peafowl_lua_lsp_lib },
			diagnostics = {
				globals = { 'vim' }
			},
      workspace = {
        library = vim.api.nvim_get_runtime_file('', true),
      },
      telemetry = {
        enable = false,
      },
		})

		goto continue
	end

	if lsp_name == "elixirls" then
		lsp.setup({
			cmd = { vim.g.peafowl_elixir_lsp_location }
		})

		goto continue
	end

	lsp.setup({})

	::continue::
end

