local cmd = vim.cmd

local hi = function(settings, fg, bg)
  for _, setting in ipairs(settings) do
    cmd('hi! ' .. setting .. ' guifg=' .. fg .. ' guibg=' .. bg)
  end
end

hi({'BufferVisible', 'BufferVisibleSign', 'BufferVisibleMod'}, '#e2e2e3', '#2F383E')
hi({'BufferInactive', 'BufferInactiveSign'}, '#434851', '#2F383E')

