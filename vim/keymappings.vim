let mapleader = " "

"ESCAPE
"-from Insert Mode
inoremap jk <esc>
"-from Visual Mode
vnoremap <leader>jk <esc>
"Do not use esc key
noremap <esc> <nop>
inoremap <esc> <nop>
vnoremap <esc> <nop>

"Save and quit
nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>

"Arrow keys diabled
noremap <up> <nop>
noremap <right> <nop>
noremap <down> <nop>
noremap <left> <nop>

inoremap <up> <nop>
inoremap <right> <nop>
inoremap <down> <nop>
inoremap <left> <nop>

vnoremap <up> <nop>
vnoremap <right> <nop>
vnoremap <down> <nop>
vnoremap <left> <nop>

nnoremap <silent> <ESC>OA <Nop>
nnoremap <silent> <ESC>OB <Nop>
nnoremap <silent> <ESC>OC <Nop>
nnoremap <silent> <ESC>OD <Nop>
inoremap <silent> <ESC>OA <Nop>
inoremap <silent> <ESC>OB <Nop>
inoremap <silent> <ESC>OC <Nop>
inoremap <silent> <ESC>OD <Nop>
vnoremap <silent> <ESC>OA <Nop>
vnoremap <silent> <ESC>OB <Nop>
vnoremap <silent> <ESC>OC <Nop>
vnoremap <silent> <ESC>OD <Nop>

"Open my vimrc
nnoremap <leader>ev :split $MYVIMRC<cr>
"Source my vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>

"Stop highligthing matches
nnoremap <leader>jk :nohlsearch<cr>

map <tab> :NERDTreeToggle<cr>


