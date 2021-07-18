local cmd = vim.cmd

local hi = function(settings, fg, bg)
  for _, setting in ipairs(settings) do
    cmd('hi! ' .. setting .. ' guifg=' .. fg .. ' guibg=' .. bg)
  end
end

hi({'BufferVisible', 'BufferVisibleSign', 'BufferVisibleMod'}, '#e2e2e3', '#2F383E')
hi({'BufferInactive', 'BufferInactiveSign'}, '#434851', '#2F383E')
hi({'CocWarningSign'}, '#CBB07A', '#2b3339')
hi({'SignColumn'}, '#d3c6aa', '#2B3339')
hi({'CocInfoSign', 'GitGutterAdd', 'GitSignsAdd'}, '#6fa19b', '#2b3339')
hi({'CocErrorSign', 'GitGutterDelete', 'GitSignsDelete'},'#e17d8f', '#2b3339')
hi({'GitGutterChange', 'GitSignsChange'}, '#a3be8c', '#2b3339')
hi({'Statusline', 'StatuslineNC'}, '#2B3339', '#2B3339')

