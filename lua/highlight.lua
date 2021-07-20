local colors = require("colors")

local hi = function(settings, fg, bg)
    for _, setting in ipairs(settings) do
        local command = 'hi! ' .. setting .. ' guifg=' .. fg .. ' guibg=' .. bg
				vim.cmd(command)
    end
end

hi({'BufferVisible', 'BufferVisibleSign', 'BufferVisibleMod'}, colors.visible_buffer, colors.buffer_bg)
hi({'BufferInactive', 'BufferInactiveSign'}, colors.inactive_buffer, colors.buffer_bg)

hi({'CocWarningSign', 'LspDiagnosticsSignWarning'}, colors.coc_warning, colors.bg)
hi({'SignColumn'}, colors.sign_column_fg, colors.bg)

hi({'CocInfoSign', 'GitGutterAdd', 'GitSignsAdd'}, colors.git_add, colors.bg)
hi({'CocErrorSign', 'GitGutterDelete', 'GitSignsDelete'}, colors.git_del, colors.bg)
hi({'GitGutterChange', 'GitSignsChange', 'LspDiagnosticsSignHint'}, colors.git_mod, colors.bg)

hi({'Statusline', 'StatuslineNC'}, colors.bg, colors.bg)

