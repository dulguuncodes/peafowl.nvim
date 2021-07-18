function LoadSession()
  silent! call sessions#session#session_load(substitute(getcwd(), "/", "_", "g"))
endfunction

command! LoadSession call LoadSession()

