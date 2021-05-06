" Install vim-plug if not found
 if empty(glob('~/dotfiles/.vim/autoload/plug.vim'))
   silent !curl -fLo ~/dotfiles/.vim/autoload/plug.vim --create-dirs
       \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
       endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
  \| endif

call plug#begin('~/dotfiles/.vim/plugged')
 
Plug 'haya14busa/incsearch.vim'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/syntastic'
Plug 'benmills/vimux'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-surround'
Plug 'mileszs/ack.vim'
Plug 'ervandew/supertab'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'christoomey/vim-tmux-navigator'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'gregsexton/matchtag'
Plug 'mattn/emmet-vim'
Plug 'ap/vim-css-color'
Plug 'leafgarland/typescript-vim'
Plug 'mustache/vim-mustache-handlebars'
Plug 'cespare/vim-toml'

call plug#end()
