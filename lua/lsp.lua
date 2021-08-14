local lspconfig = require('lspconfig')
local g = vim.g

local on_attach = function(client, bufnr)
    local buf_map = vim.api.nvim_buf_set_keymap
    vim.cmd("command! LspDef lua vim.lsp.buf.definition()")
    vim.cmd("command! LspFormatting lua vim.lsp.buf.formatting()")
    vim.cmd("command! LspCodeAction lua vim.lsp.buf.code_action()")
    vim.cmd("command! LspHover lua vim.lsp.buf.hover()")
    vim.cmd("command! LspRename lua vim.lsp.buf.rename()")
    vim.cmd("command! LspOrganize lua lsp_organize_imports()")
    vim.cmd("command! LspRefs lua vim.lsp.buf.references()")
    vim.cmd("command! LspTypeDef lua vim.lsp.buf.type_definition()")
    vim.cmd("command! LspImplementation lua vim.lsp.buf.implementation()")
    vim.cmd("command! LspDiagPrev lua vim.lsp.diagnostic.goto_prev()")
    vim.cmd("command! LspDiagNext lua vim.lsp.diagnostic.goto_next()")
    vim.cmd("command! LspDiagLine lua vim.lsp.diagnostic.show_line_diagnostics()")
    vim.cmd("command! LspSignatureHelp lua vim.lsp.buf.signature_help()")buf_map(bufnr, "n", "gd", ":LspDef<CR>", {silent = true})

    buf_map(bufnr, "n", "gr", ":LspRename<CR>", {silent = true})
    buf_map(bufnr, "n", "gR", ":LspRefs<CR>", {silent = true})
    buf_map(bufnr, "n", "gy", ":LspTypeDef<CR>", {silent = true})
    buf_map(bufnr, "n", "K", ":LspHover<CR>", {silent = true})
    buf_map(bufnr, "n", "gs", ":LspOrganize<CR>", {silent = true})
    buf_map(bufnr, "n", "[a", ":LspDiagPrev<CR>", {silent = true})
    buf_map(bufnr, "n", "]a", ":LspDiagNext<CR>", {silent = true})
    buf_map(bufnr, "n", "ga", ":LspCodeAction<CR>", {silent = true})
    buf_map(bufnr, "n", "<Leader>a", ":LspDiagLine<CR>", {silent = true})
    buf_map(bufnr, "i", "<C-x><C-x>", "<cmd> LspSignatureHelp<CR>", {silent = true})
    if client.resolved_capabilities.document_formatting then
        vim.api.nvim_exec([[
         augroup LspAutocommands
             autocmd! * <buffer>
             autocmd BufWritePost <buffer> LspFormatting
         augroup END
         ]], true)
    end
end


local servers = {
  sumneko_lua = {
    cmd = { g.peafowl_lua_lsp_location, '-E', g.peafowl_lua_lsp_lib },
    diagnostics = {
      globals = { 'vim' }
    },
    workspace = {
      library = vim.api.nvim_get_runtime_file('', true),
    },
    telemetry = {
      enable = false,
    },
  },
  elixirls = {
    cmd = { g.peafowl_elixir_lsp_location }
  },
  diagnosticls = {
    filetypes = {"javascript", "javascriptreact", "typescript", "typescriptreact", "css", "html", "json"},
    init_options = {
      filetypes = {
        javascript = "eslint",
        typescript = "eslint",
        javascriptreact = "eslint",
        typescriptreact = "eslint",
        json = "prettier"
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
          }
        }
      },
      formatters = {
        prettier = {
          command = 'prettier',
          args = { '--stdin-filepath', '%filename' }
        }
      },
      formatFiletypes = {
        css = 'prettier',
        javascript = 'prettier',
        javascriptreact = 'prettier',
        json = 'prettier',
        scss = 'prettier',
        less = 'prettier',
        typescript = 'prettier',
        typescriptreact = 'prettier',
        markdown = 'prettier',
      },
    }
  },
  tsserver = {
    on_attach = function(client)
      client.resolved_capabilities.document_formatting = false
      on_attach(client)
    end,
    cmd = { "/opt/homebrew/bin/typescript-language-server", "--stdio" }
  }
}

vim.lsp.set_log_level("debug")

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

