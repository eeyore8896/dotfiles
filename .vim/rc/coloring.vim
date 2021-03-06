
"==============================================================
"          ColorScheme                                      {{{
"==============================================================

function! s:SetColorScheme()
  if has('syntax') && !exists('g:syntax_on')
    syntax on " シンタックスカラーリングオン
  endif
  set t_Co=256
  set background=dark
  try
    let g:color_scheme = 'hybrid'
    execute 'colorscheme ' g:color_scheme
  catch /^Vim\%((\a\+)\)\=:E185/
    let g:color_scheme = 'desert'
    execute 'colorscheme ' g:color_scheme
    colorscheme desert
    " ポップアップメニューの色変える
    highlight Pmenu ctermfg=Black ctermbg=Gray
    highlight PmenuSel ctermfg=Black ctermbg=Cyan
    highlight PmenuSbar ctermfg=White ctermbg=DarkGray
    highlight PmenuThumb ctermfg=DarkGray ctermbg=White
  endtry
  set nocursorline
endfunction

call s:SetColorScheme()

" 読み取り専用をわかりやすく
function! s:CheckRo()
  if &readonly
    colorscheme morning
  else
    if g:colors_name != g:color_scheme
      call s:SetColorScheme()
    endif
  endif
endfunction

function! WrapForTmux(s)
  if !exists('$TMUX')
    return a:s
  endif

  let tmux_start = "\<Esc>Ptmux;"
  let tmux_end = "\<Esc>\\"

  return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction

" Cursor style
if has('nvim')
  set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor
else
  " insert mode - line
  let &t_SI .= WrapForTmux("\<Esc>[5 q")
  " common - block
  let &t_EI .= WrapForTmux("\<Esc>[1 q")
  if (v:version == 704 && has('patch687')) || v:version >= 705
    " replace mode - underline
    let &t_SR .= WrapForTmux("\<Esc>[3 q")
  endif
endif

" }}}

