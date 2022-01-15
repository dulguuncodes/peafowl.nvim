local lfs = require 'lfs';

local dir = vim.api.nvim__get_runtime({'lua/colorschemes'}, false, { is_lua = true })[1]
for name in lfs.dir(dir) do
  if name == 'init.lua' or name == '.' or name == '..' then
    goto continue
  end

  local module = string.match(name, "^(.*).lua$")
  print(vim.inspect(require('colorschemes.' .. module)))

  ::continue::
end
