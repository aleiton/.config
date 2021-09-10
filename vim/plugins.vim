" Install vim-plug if not found
 if empty(glob('~/.config/vim/autoload/plug.vim'))
   silent !curl -fLo ~/.config/vim/autoload/plug.vim --create-dirs
       \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
       endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
  \| endif

call plug#begin('~/.config/vim/plugged')

" Status bar
Plug 'itchyny/lightline.vim'

" Navigation & search
Plug 'junegunn/fzf', { 'do': { -> fzf#install()  }  }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'ludovicchabant/vim-gutentags'

" Three menu
Plug 'scrooloose/nerdtree'

" Utils & Snipets
Plug 'nathanaelkane/vim-indent-guides'
Plug 'gregsexton/matchtag'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'

" Git integration
Plug 'tpope/vim-fugitive'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Tmux integration
Plug 'christoomey/vim-tmux-navigator'

" Themes, colors & icons
Plug 'ryanoasis/vim-devicons'
Plug 'bryanmylee/vim-colorscheme-icons'
Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline-themes'

" Language & frameworks
Plug 'sheerun/vim-polyglot'
Plug 'ap/vim-css-color'
Plug 'mattn/emmet-vim'
Plug 'pangloss/vim-javascript'
" Plug 'mxw/vim-jsx'
Plug 'mustache/vim-mustache-handlebars'
Plug 'rust-lang/rust.vim'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'leafgarland/typescript-vim'
Plug 'cespare/vim-toml'


" LSP - Lint / Syntax highlight
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
" Plug 'w0rp/ale'

" Autocompletion / Omnicompletion
"Plug 'lifepillar/vim-mucomplete'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

call plug#end()
