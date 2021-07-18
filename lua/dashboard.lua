local g = vim.g

g.dashboard_disable_at_vimenter = 0

g.dashboard_custom_header = {
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
	"   `\"\"\"---......---\"\"\"`"
}

g.dashboard_disable_statusline = 0

g.dashboard_custom_section = {
    a = {
        description = {"  Find File                 SPC f f"},
        command = "Telescope find_files"
    },
    b = {
        description = {"  Recents                   SPC f o"},
        command = "Telescope oldfiles"
    },
    c = {
        description = {"  Find Word                 SPC f w"},
        command = "Telescope live_grep"
    },
    d = {
        description = {"洛 New File                  SPC f n"},
        command = "DashboardNewFile"
    },
    e = {
        description = {"  Open up NvimTree          SPC b m"},
        command = "NvimTreeToggle"
    },
    f = {
        description = {"  Load Last Session         SPC s l"},
        command = "LoadSession"
    }
}
