"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/haruka/./.vim/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/haruka/.vim/dein')
  call dein#begin('/home/haruka/.vim/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/home/haruka/.vim/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here like this:
  "call dein#add('Shougo/neosnippet.vim')
  "call dein#add('Shougo/neosnippet-snippets')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

"End dein Scripts-------------------------




"F5キーでPython3を実行できるようにする
nmap <F5> :!python3 %

"NERDTreeを自動で実行する
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"Ctrl+eでNERDTreeを表示
nnoremap <silent><C-e> :NERDTreeToggle<CR>
