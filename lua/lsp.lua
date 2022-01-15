local lspconfig = require("lspconfig")

-- A list of Language Servers to work with Neovim
-- For more info on configuring the LSP: https://github.com/dulguuncodes/peafowl/wiki/LSP
local servers = {
  sumneko_lua = {
    cmd = {"/usr/local/bin/lua-language-server", "-E", "/usr/local/lib/lua-language-server"},
    diagnostics = {
      globals = {"vim"}
    },
    workspace = {
      library = vim.api.nvim_get_runtime_file("", true)
    },
    telemetry = {
      enable = false
    }
  },
  pyright = true,
  diagnosticls = {
    filetypes = {"javascript", "javascriptreact", "typescript", "typescriptreact"},
    init_options = {
      filetypes = {
        javascript = "eslint",
        javascriptreact = "eslint",
        typescript = "eslint",
        typescriptreact = "eslint"
      },
      linters = {
        eslint = {
          sourceName = "eslint",
          command = "./node_modules/.bin/eslint",
          rootPatterns = {
            ".eslitrc.js",
            "package.json"
          },
          debounce = 100,
          args = {
            "--cache",
            "--stdin",
            "--stdin-filename",
            "%filepath",
            "--format",
            "json"
          },
          parseJson = {
            errorsRoot = "[0].messages",
            line = "line",
            column = "column",
            endLine = "endLine",
            endColumn = "endColumn",
            message = "${message} [${ruleId}]",
            security = "severity"
          },
          securities = {
            [2] = "error",
            [1] = "warning"
          },
        },
      },
      formatters = {
        prettier = {
          command = "prettier",
          args = {"--stdin-filepath", "%filename"}
        },
      },
    },
  },
  tsserver = true,
  ccls = true
}

local register_servers = function(_servers)
  for lsp_name, lsp_config in pairs(_servers) do
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
