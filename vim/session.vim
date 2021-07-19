function LoadSession()
  if get(g:, 'debug_sessions', 0) == 1
    call sessions#session#session_load(substitute(getcwd(), "/", "_", "g"))
    return
  endif

  silent! call sessions#session#session_load(substitute(getcwd(), "/", "_", "g"))
endfunction

command! LoadSession call LoadSession()

