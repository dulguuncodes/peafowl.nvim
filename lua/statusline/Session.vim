let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/.config/nvim/lua/statusline
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +7 init.lua
badd +11 symbols.lua
badd +172 components.lua
badd +1 term://~/.config/nvim/lua/statusline//108831:/bin/fish
badd +1 utilities.lua
badd +12 colors.lua
argglobal
%argdel
$argadd init.lua
edit utilities.lua
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
wincmd _ | wincmd |
vsplit
2wincmd h
wincmd _ | wincmd |
split
1wincmd k
wincmd w
wincmd w
wincmd _ | wincmd |
split
1wincmd k
wincmd w
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe '1resize ' . ((&lines * 26 + 27) / 55)
exe 'vert 1resize ' . ((&columns * 59 + 112) / 224)
exe '2resize ' . ((&lines * 25 + 27) / 55)
exe 'vert 2resize ' . ((&columns * 59 + 112) / 224)
exe '3resize ' . ((&lines * 26 + 27) / 55)
exe 'vert 3resize ' . ((&columns * 99 + 112) / 224)
exe '4resize ' . ((&lines * 25 + 27) / 55)
exe 'vert 4resize ' . ((&columns * 99 + 112) / 224)
exe 'vert 5resize ' . ((&columns * 64 + 112) / 224)
argglobal
balt symbols.lua
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 2 - ((1 * winheight(0) + 13) / 26)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 2
normal! 0
wincmd w
argglobal
if bufexists("colors.lua") | buffer colors.lua | else | edit colors.lua | endif
if &buftype ==# 'terminal'
  silent file colors.lua
endif
balt utilities.lua
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 6 - ((5 * winheight(0) + 12) / 25)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 6
normal! 022|
wincmd w
argglobal
if bufexists("components.lua") | buffer components.lua | else | edit components.lua | endif
if &buftype ==# 'terminal'
  silent file components.lua
endif
balt symbols.lua
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 183 - ((18 * winheight(0) + 13) / 26)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 183
normal! 06|
wincmd w
argglobal
if bufexists("init.lua") | buffer init.lua | else | edit init.lua | endif
if &buftype ==# 'terminal'
  silent file init.lua
endif
balt utilities.lua
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 8 - ((7 * winheight(0) + 12) / 25)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 8
normal! 066|
wincmd w
argglobal
if bufexists("term://~/.config/nvim/lua/statusline//108831:/bin/fish") | buffer term://~/.config/nvim/lua/statusline//108831:/bin/fish | else | edit term://~/.config/nvim/lua/statusline//108831:/bin/fish | endif
if &buftype ==# 'terminal'
  silent file term://~/.config/nvim/lua/statusline//108831:/bin/fish
endif
balt components.lua
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 9 - ((8 * winheight(0) + 26) / 52)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 9
normal! 0
wincmd w
3wincmd w
exe '1resize ' . ((&lines * 26 + 27) / 55)
exe 'vert 1resize ' . ((&columns * 59 + 112) / 224)
exe '2resize ' . ((&lines * 25 + 27) / 55)
exe 'vert 2resize ' . ((&columns * 59 + 112) / 224)
exe '3resize ' . ((&lines * 26 + 27) / 55)
exe 'vert 3resize ' . ((&columns * 99 + 112) / 224)
exe '4resize ' . ((&lines * 25 + 27) / 55)
exe 'vert 4resize ' . ((&columns * 99 + 112) / 224)
exe 'vert 5resize ' . ((&columns * 64 + 112) / 224)
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0&& getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToOFA
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
let g:this_session = v:this_session
let g:this_obsession = v:this_session
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
