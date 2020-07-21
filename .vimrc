"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

let s:dein_path = expand('~/.vim/dein')
let s:dein_repo_path = s:dein_path . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_path)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_path
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_path, ':p')
endif

if dein#load_state(s:dein_path)
  call dein#begin(s:dein_path)

  let g:config_dir  = expand('~/.vim/userconfig')
  let s:toml        = g:config_dir . '/plugin.toml'
  let s:lazy_toml   = g:config_dir . '/plugin_lazy.toml'

  " TOML 読み込み
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif


" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif
"End dein Scripts-------------------------

"pyenvとvimのパスの自動設定
function! IncludePath(path)
  " define delimiter depends on platform
  if has('win16') || has('win32') || has('win64')
    let delimiter = ";"
  else
    let delimiter = ":"
  endif
  let pathlist = split($PATH, delimiter)
  if isdirectory(a:path) && index(pathlist, a:path) == -1
    let $PATH=a:path.delimiter.$PATH
  endif
endfunction
call IncludePath(expand("~/.pyenv/shims"))

"F5キーでPython3とCを実行できるようにする
command! Run call s:Run()
nmap <F5> :Run<CR>
function! s:Run()
  let e = expand("%:e")
  if e == "c"
    :Gcc
  endif
  if e == "py"
    :Python
  endif
  if e == "cpp"
	:Gpp
  endif
endfunction

command! Python call s:Python()
function! s:Python()
  :!python %
endfunction

command! Gcc call s:Gcc()
function! s:Gcc()
  :!gcc % -o %:r
  :!./%:r
endfunction

command! Gpp call s:Gpp()
function! s:Gpp()
  :!g++ % -o %:r
  :!./%:r
endfunction


"NERDTreeを自動で実行する
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"Ctrl+eでNERDTreeを表示
nnoremap <silent><C-e> :NERDTreeToggle<CR>

"行番号
set number
"autocmd ColorScheme * highlight Comment ctermfg=250 ctermbg=240

"行を強調表示
set cursorline

"カラースキーム
set background=dark
colorscheme lucius

"背景透過
highlight Normal ctermbg=none guibg=NONE
highlight NonText ctermbg=none guibg=NONE
highlight LineNr ctermbg=none guibg=NONE
highlight Folded ctermbg=none guibg=NONE
highlight EndOfBuffer ctermbg=none guibg=NONE

"クリップボード連携
set clipboard=unnamedplus

"vim-minimapを自動で実行する
"autocmd VimEnter * Minimap

"Ctrl+rでvim-minimapを非表示
nnoremap <silent><C-r> :MinimapClose<CR>

"windowのsplit
nmap ss :split<Return><C-w>w
nmap sv :vsplit<Return><C-w>w

"window移動のキーバインド
map sh <C-w>h
map sk <C-w>k
map sj <C-w>j
map sl <C-w>l

"tab移動のキーバインド
nmap <S-Tab> :tabprev<Return>
nmap <Tab> :tabnext<Return>

"autopep8をF7で実行
function! Preserve(command)
    " Save the last search.
    let search = @/
    " Save the current cursor position.
    let cursor_position = getpos('.')
    " Save the current window position.
    normal! H
    let window_position = getpos('.')
    call setpos('.', cursor_position)
    " Execute the command.
    execute a:command
    " Restore the last search.
    let @/ = search
    " Restore the previous window position.
    call setpos('.', window_position)
    normal! zt
    " Restore the previous cursor position.
    call setpos('.', cursor_position)
endfunction
function! Autopep8()
    call Preserve(':silent %!autopep8 --ignore=E501 -')
endfunction
autocmd FileType python nnoremap <S-f> :call Autopep8()<CR>

let g:indentLine_char_list = ['|', '¦', '┆', '┊']

set tabstop=4
set shiftwidth=4
