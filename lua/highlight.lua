local colors = require("colors")
local cmd = vim.cmd

local hi = function(settings, fg, bg)
    for _, setting in ipairs(settings) do
        cmd('hi! ' .. setting .. ' guifg=' .. fg .. ' guibg=' .. bg)
    end
end

hi({'BufferVisible', 'BufferVisibleSign', 'BufferVisibleMod'}, colors.visible_buffer, colors.buffer_bg)
hi({'BufferInactive', 'BufferInactiveSign'}, colors.inactive_buffer, colors.buffer_bg)

hi({'CocWarningSign'}, colors.coc_warning, colors.bg)
hi({'SignColumn'}, colors.sign_column_fg, colors.bg)

hi({'CocInfoSign', 'GitGutterAdd', 'GitSignsAdd'}, colors.git_add, colors.bg)
hi({'CocErrorSign', 'GitGutterDelete', 'GitSignsDelete'}, colors.git_del, colors.bg)
hi({'GitGutterChange', 'GitSignsChange'}, colors.git_mod, colors.bg)

hi({'Statusline', 'StatuslineNC'}, colors.bg, colors.bg)

