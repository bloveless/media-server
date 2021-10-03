let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/Projects/media-server
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +1 templates/NOTES.txt
badd +9 templates/deployment.yaml
badd +24 values.yaml
badd +3 .helmignore
badd +2 Session.vim
badd +12 Chart.yaml
badd +3 templates/hpa.yaml
badd +1 templates/ingress.yaml
badd +5 templates/service.yaml
badd +2 templates/serviceaccount.yaml
badd +38 templates/_helpers.tpl
badd +1 templates/plex-deployment.yaml
badd +1 templates/deployment-plex.yaml
badd +36 templates/ingress-plex.yaml
badd +10 templates/service-plex.yaml
badd +1 templates/plex-ingress.yaml
badd +37 templates/plex-pvc.yaml
badd +6 Makefile
badd +50 templates/radarr-deployment.yaml
badd +14 templates/radarr-pvc.yaml
badd +27 templates/transmission-deployment.yaml
badd +4 templates/transmission-pvc.yaml
badd +25 templates/plex-service.yaml
badd +1 templates/transmission-service.yaml
badd +37 templates/jackett-deployment.yaml
badd +7 templates/jackett-pvc.yaml
badd +1 templates/jackett-service.yaml
badd +7 templates/radarr-service.yaml
badd +1 templates/radarr-ingress.yaml
badd +1 templates/jackett-ingress.yaml
badd +25 templates/transmission-ingress.yaml
badd +1 ~/Projects/media-server
argglobal
%argdel
$argadd ~/Projects/media-server
edit templates/transmission-deployment.yaml
argglobal
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
let s:l = 32 - ((31 * winheight(0) + 21) / 42)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 32
normal! 063|
lcd ~/Projects/media-server
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0&& getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToOFc
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
