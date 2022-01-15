local lfs = require('lfs');

local dir = vim.api.nvim__get_runtime({'lua/colorschemes'}, false, { is_lua = true })[1]

local M = {}

for name in lfs.dir(dir) do
  if name == 'init.lua' or name == '.' or name == '..' then
    goto continue
  end

  local module_name = string.match(name, "^(.*).lua$")
  local module = require('colorschemes.' .. module_name)

  M[module_name] = module

  ::continue::
end

return M
