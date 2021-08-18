local symbols = require("statusline.symbols")
local g = vim.g

g.dashboard_disable_at_vimenter = 0

local custom_header = {
  "            _/_",
  "          -'a\\",
  "            ||",
  "            |J",
  "            2_\\",
  "           /:::\\",
  "          |;ooo;|",
  "          /Oo@ o\\",
  "         '/o oOo\\`",
  "         /@ O o @\\",
  "        '/.o,()o,\\`",
  "        /().O O  o\\",
  "       / @ , @. () \\",
  "      /,o O' o O o, \\",
  "   _-'. 'o _o _O_o-o.`-_",
  '   `"""---......---"""`',
  "                             "
}

if g.peafowl_branding == 1 then
  custom_header[#custom_header + 1] = "        " .. symbols.peacock .. " peafowl           "
end

g.dashboard_custom_header = custom_header

g.dashboard_disable_statusline = 0

g.dashboard_custom_section = {
  a = {
    description = {"   Find File                 SPC t f"},
    command = "Telescope find_files"
  },
  b = {
    description = {"   Recents                   SPC t r"},
    command = "Telescope oldfiles"
  },
  c = {
    description = {"   Find Word                 SPC t g"},
    command = "Telescope live_grep"
  },
  e = {
    description = {"  Open up NvimTree          SPC n"},
    command = "NvimTreeToggle"
  },
  f = {
    description = {"  Toggle Sessions           SPC b"},
    command = "Obsess"
  },
  g = {
    description = {"  Load Last Session         SPC s"},
    command = "silent! source Session.vim"
  }
}
