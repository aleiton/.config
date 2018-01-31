let mapleader = " "

"ESCAPE
"-from Insert Mode
inoremap jk <esc>
"-from Visual Mode
vnoremap <leader>jk <esc>
"Do not use esc key
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

"Open my vimrc
nnoremap <leader>ev :split $MYVIMRC<cr>
"Source my vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>

"Stop highligthing matches
nnoremap <leader>jk :nohlsearch<cr>

map <tab> :NERDTreeToggle<cr>

