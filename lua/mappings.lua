function Map(keymaps)
    for i, keymap in ipairs(keymaps) do
        vim.api.nvim_set_keymap(keymap.type, keymap.key, keymap.cmd, keymap.opts)
    end
end

Map({{
    type = 'n',
    key = '<Leader>t',
    cmd = ':ToggleWorkspace<CR>',
    opts = {
        noremap = true,
        silent = false
    }
}, {
    type = 't',
    key = '<Leader>t',
    cmd = '<C-\\><C-n>:ToggleWorkspace<CR>',
    opts = {
        noremap = true,
        silent = false
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
}})

