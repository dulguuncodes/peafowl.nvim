local cmd = vim.cmd

local hi = function(settings, fg, bg)
  for _, setting in ipairs(settings) do
    cmd('hi! ' .. setting .. ' guifg=' .. fg .. ' guibg=' .. bg)
  end
end

hi({'BufferVisible', 'BufferVisibleSign', 'BufferVisibleMod'}, '#e2e2e3', '#2F383E')
hi({'BufferInactive', 'BufferInactiveSign'}, '#434851', '#2F383E')
hi({'SignColumn'}, '#d3c6aa', '#2B3339')
hi({'CocInfoSign', 'GitGutterAdd', 'GitSignsAdd'}, '#2b3339', '#6fa19b')
hi({'CocErrorSign', 'GitGutterDelete', 'GitSignsDelete'}, '#2b3339', '#e17d8f')
hi({'GitGutterChange', 'GitSignsChange'}, '#2b3339', '#a3be8c')
hi({'Statusline', 'StatuslineNC'}, '#2B3339', '#2B3339')

