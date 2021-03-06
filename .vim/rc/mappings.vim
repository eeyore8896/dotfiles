
"==============================================================
"          Key mapping                                      {{{
"==============================================================

" 表示行単位で移動
noremap j gj
noremap k gk
vnoremap j gj
vnoremap k gk

" undo behavior
inoremap <BS> <C-g>u<BS>
inoremap <CR> <C-g>u<CR>
inoremap <DEL> <C-g>u<DEL>
inoremap <C-w> <C-g>u<C-w>

" Emacs style
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" function key
imap <F1>  <Esc><F1>
imap <F2>  <Esc><F2>
imap <F3>  <Esc><F3>
imap <F4>  <Esc><F4>
imap <F5>  <Esc><F5>
imap <F6>  <Esc><F6>
imap <F7>  <Esc><F7>
imap <F8>  <Esc><F8>
imap <F9>  <Esc><F9>
imap <F10> <Esc><F10>
imap <F11> <Esc><F11>
imap <F12> <Esc><F12>
cmap <F1>  <Esc><F1>
cmap <F2>  <Esc><F2>
cmap <F3>  <Esc><F3>
cmap <F4>  <Esc><F4>
cmap <F5>  <Esc><F5>
cmap <F6>  <Esc><F6>
cmap <F7>  <Esc><F7>
cmap <F8>  <Esc><F8>
cmap <F9>  <Esc><F9>
cmap <F10> <Esc><F10>
cmap <F11> <Esc><F11>
cmap <F12> <Esc><F12>

" ハイライト消す
nnoremap <silent> gh :nohlsearch<CR>

" コピー
nnoremap Y y$

" インクリメント設定
noremap + <C-a>
noremap - <C-x>

vnoremap ,y "+y
vnoremap ,d "+d
nnoremap ,p "+p
nnoremap ,P "+P
vnoremap ,p "+p
vnoremap ,P "+P

" x,dはレジスタに登録しない
noremap x "_x
nnoremap d "_d
nnoremap D "_D
nnoremap dd dd
nnoremap <Leader>dd "_dd

" move changes
nnoremap <F10> g;zz
nnoremap <S-F10> g,zz

" refresh Use <F5> to clear the highlighting of :set hlsearch.
if maparg('<F5>', 'n') ==# ''
  nnoremap <silent> <F5> :nohlsearch<C-r>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-l>
endif

" move tab
nnoremap <S-F2> gT
nnoremap <S-F3> gt

" move buffer
nnoremap <F2> :bprev<CR>
nnoremap <F3> :bnext<CR>

nnoremap [q           :cprevious<CR>
nnoremap ]q           :cnext<CR>
nnoremap [Q           :cfirst<CR>
nnoremap ]Q           :clast<CR>
nnoremap [l           :lprevious<CR>
nnoremap ]l           :lnext<CR>
nnoremap [L           :lfirst<CR>
nnoremap ]L           :llast<CR>
nnoremap [b           :bprevious<CR>
nnoremap ]b           :bnext<CR>
nnoremap [B           :bfirst<CR>
nnoremap ]B           :blast<CR>
nnoremap [t           :tabprevious<CR>
nnoremap ]t           :tabnext<CR>
nnoremap [T           :tabfirst<CR>
nnoremap ]T           :tablast<CR>

" Go to tab by number
nnoremap <Leader>1 1gt
nnoremap <Leader>2 2gt
nnoremap <Leader>3 3gt
nnoremap <Leader>4 4gt
nnoremap <Leader>5 5gt
nnoremap <Leader>6 6gt
nnoremap <Leader>7 7gt
nnoremap <Leader>8 8gt
nnoremap <Leader>9 9gt
nnoremap <Leader>0 :tablast<CR>

" Tab move(alt-left/right)
nnoremap <silent> <S-PageUp> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <S-PageDown> :execute 'silent! tabmove ' . (tabpagenr()+1)<CR>

" change paragraph
"nnoremap (  {zz
"nnoremap )  }zz
"nnoremap ]] ]]zz
"nnoremap [[ [[zz
"nnoremap [] []zz
"nnoremap ][ ][zz

" For replace
nnoremap gr gd[{V%::s/<C-R>///gc<left><left><left>
nnoremap gR gD:%s/<C-R>///gc<left><left><left>

" Undoable<C-w> <C-u>
inoremap <C-w> <C-g>u<C-w>
inoremap <C-u> <C-g>u<C-u>

" Change current directory
nnoremap ,cd :lcd %:p:h<CR>:pwd<CR>

" Delete buffer
nnoremap ,bd :bdelete<CR>

" Delete all marks
nnoremap ,md :delmarks!<CR>

" Change encoding
nnoremap ,eu :e ++enc=utf-8<CR>
nnoremap ,es :e ++enc=cp932<CR>
nnoremap ,ee :e ++enc=euc-jp<CR>
nnoremap ,ej :e ++enc=iso-2022-jp<CR>

" tags jump
nnoremap <C-]> g<C-]>

" useful search
nnoremap <expr> n  'Nn'[v:searchforward]
nnoremap <expr> N  'nN'[v:searchforward]
cnoremap <C-s> <HOME><Bslash><lt><END><Bslash>><CR>

" Edit macro
nnoremap ,me  :<C-u><C-r><C-r>='let @'. v:register .' = '. string(
      \ getreg(v:register))<CR><C-f><left>

" indent
xnoremap <  <gv
xnoremap >  >gv

nnoremap [[ []%
nnoremap ]] ][][%

" expand path
cmap <C-x> <C-r>=expand('%:p:h')<CR>/
" expand file (not ext)
cmap <C-z> <C-r>=expand('%:p:r')<CR>

" completion
inoremap <expr><CR>       pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <expr><Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr><Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr><PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr><PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"
inoremap <expr><TAB>      pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>    pumvisible() ? "\<C-p>" : "\<S-TAB>"

" }}}

