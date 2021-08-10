-- creating a keymap is relatively easy, simply add a table to the array that follows
-- following format
--
-- `{type = 'n | v | ...', key = '<Leader>foobar', cmd = ':new<CR>', opts = { ...options }}`
-- where *options* is in the following format `{ noremap = true | false, silent = true | false }`
--
-- for example.
-- `{ type = 'n', key = '<C-n>', cmd = ':tabnew<CR>', opts = { noremap = true, silent = false } }`
-- is the lua equivalant of vim's
-- `noremap <C-n> :tabnew<CR>
--
-- further questions can be asked inside the repository issues section
--
-- given a table, it uses `vim.api.nvim_set_keymap` to create keybinds
-- @param keymaps any
function Map(keymaps)
    for _, keymap in ipairs(keymaps) do
        vim.api.nvim_set_keymap(keymap.type, keymap.key, keymap.cmd, keymap.opts)
    end
end

local keymaps = {{
    type = 'n',
    key = '<Leader>t',
    cmd = ':Obsess<CR>',
    opts = {
        noremap = true,
        silent = true
    }
}, {
    type = 't',
    key = '<Leader>t',
    cmd = '<C-\\><C-n>:Obsess<CR>',
    opts = {
        noremap = true,
        silent = true
    }
}, {
    type = 'v',
    key = '<Leader>y',
    cmd = '"+y',
    opts = {
        noremap = true,
        silent = false
    }
}, {
    type = 'n',
    key = '<Leader>Y',
    cmd = '"+yg',
    opts = {
        noremap = true,
        silent = false
    }
}, {
    type = 'n',
    key = '<Leader>y',
    cmd = '"+y',
    opts = {
        noremap = true,
        silent = false
    }
}, {
    type = 'n',
    key = '<Leadr>yy',
    cmd = '"+yy',
    opts = {
        noremap = true,
        silent = false
    }
}, {
    type = 'n',
    key = '<Leader>p',
    cmd = '"+p',
    opts = {
        noremap = true,
        silent = false
    }
}, {
    type = 'n',
    key = '<Leader>P',
    cmd = '"+p',
    opts = {
        noremap = true,
        silent = false
    }
}, {
    type = 'v',
    key = '<Leader>p',
    cmd = '"+p',
    opts = {
        noremap = true,
        silent = false
    }
}, {
    type = 'v',
    key = '<Leader>P',
    cmd = '"+p',
    opts = {
        noremap = true,
        silent = false
    }
}, {
    type = 'n',
    key = '<C-Right>',
    cmd = ':tabnext<CR>',
    opts = {
        noremap = true,
        silent = true
    }
}, {
    type = 'n',
    key = '<C-Left>',
    cmd = ':tabprev<CR>',
    opts = {
        noremap = true,
        silent = true
    }
}, {
    type = 'n',
    key = '<Leader>tr',
    cmd = ":Telescope oldfiles<CR>",
    opts = {
        noremap = false,
        silent = true
    }
}, {
    type = 'n',
    key = '<Leader>te',
    cmd = ':Telescope find_files<CR>',
    opts = {
        noremap = false,
        silent = true
    }
}, {
    type = 'n',
    key = '<Leader>tg',
    cmd = ':Telescope live_grep<CR>',
    opts = {
        noremap = false,
        silent = true
    }
}, {
    type = 'n',
    key = '<C-n>',
    cmd = ':NvimTreeToggle<CR>',
    opts = {
        noremap = true,
        silent = false
    }
}, {
    type = 'n',
    key = '<C-d>',
    cmd = ':tabnew | Dashboard<CR>',
    opts = {
        noremap = true,
        silent = true
    }
}, {
    type = 'v',
    key = '<C-d>',
    cmd = '<C-\\><C-n><Cmd>tabnew | Dashboard<CR>',
    opts = {
        noremap = true,
        silent = false
    }
  }, {
    type = 'n',
    key = '<Leader>ca',
    cmd = '<Cmd>lua vim.lsp.buf.code_action()<CR>',
    opts = {
      noremap = false,
      silent = false
    },
  }
}

Map(keymaps)
