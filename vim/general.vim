set nocompatible
filetype plugin indent on
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
" Fuzzy Finder
set path+=**
set wildmenu
set showmatch
set incsearch
set hlsearch
set incsearch
set modifiable
set encoding=UTF-8

" XDG support
set runtimepath^=$XDG_CONFIG_HOME/vim
set runtimepath+=$XDG_DATA_HOME/vim
set runtimepath+=$XDG_CONFIG_HOME/vim/after

set packpath^=$XDG_DATA_HOME/vim,$XDG_CONFIG_HOME/vim
set packpath+=$XDG_CONFIG_HOME/vim/after,$XDG_DATA_HOME/vim/after

let g:netrw_home = $XDG_DATA_HOME."/vim"
call mkdir($XDG_DATA_HOME."/vim/spell", 'p', 0700)
set viewdir=$XDG_DATA_HOME/vim/view | call mkdir(&viewdir, 'p', 0700)

set backupdir=$XDG_CACHE_HOME/vim/backup | call mkdir(&backupdir, 'p', 0700)
set directory=$XDG_CACHE_HOME/vim/swap   | call mkdir(&directory, 'p', 0700)
set undodir=$XDG_CACHE_HOME/vim/undo     | call mkdir(&undodir,   'p', 0700)

set viminfofile=$XDG_CACHE_HOME/vim/viminfo
