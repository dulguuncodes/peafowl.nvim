local lspconfig = require("lspconfig")
local g = vim.g

-- A list of Language Servers to work with Neovim
-- For more info on configuring the LSP: https://github.com/dulguuncodes/peafowl/wiki/LSP
local servers = {}

local register_servers = function(servers)
  for lsp_name, lsp_config in pairs(servers) do
    local lsp = lspconfig[lsp_name]

    if not lsp then
      print("Unknown LSP: " .. lsp_name)
      return
    end

    if type(lsp_config) == "boolean" and lsp_config then
      lsp.setup({})

      goto continue
    end

    lsp.setup(lsp_config)

    ::continue::
  end
end

register_servers(servers)
