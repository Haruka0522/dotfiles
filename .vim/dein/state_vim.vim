if g:dein#_cache_version !=# 100 || g:dein#_init_runtimepath !=# '/home/haruka/.vim/dein/repos/github.com/Shougo/dein.vim/,/home/haruka/.vim,/var/lib/vim/addons,/usr/share/vim/vimfiles,/usr/share/vim/vim80,/usr/share/vim/vimfiles/after,/var/lib/vim/addons/after,/home/haruka/.vim/after' | throw 'Cache loading error' | endif
let [plugins, ftplugin] = dein#load_cache_raw(['/home/haruka/.vimrc', '/home/haruka/.vim/userconfig/plugin.toml', '/home/haruka/.vim/userconfig/plugin_lazy.toml'])
if empty(plugins) | throw 'Cache loading error' | endif
let g:dein#_plugins = plugins
let g:dein#_ftplugin = ftplugin
let g:dein#_base_path = '/home/haruka/.vim/dein'
let g:dein#_runtime_path = '/home/haruka/.vim/dein/.cache/.vimrc/.dein'
let g:dein#_cache_path = '/home/haruka/.vim/dein/.cache/.vimrc'
let &runtimepath = '/home/haruka/.vim/dein/repos/github.com/Shougo/dein.vim/,/home/haruka/.vim,/var/lib/vim/addons,/usr/share/vim/vimfiles,/home/haruka/.vim/dein/repos/github.com/Shougo/dein.vim,/home/haruka/.vim/dein/.cache/.vimrc/.dein,/usr/share/vim/vim80,/home/haruka/.vim/dein/.cache/.vimrc/.dein/after,/usr/share/vim/vimfiles/after,/var/lib/vim/addons/after,/home/haruka/.vim/after'
filetype off
