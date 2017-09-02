let mapleader = " "

"Escape from Insert Mode
inoremap jk <esc>
"Do not use esc key
inoremap <esc> <nop> 

"Arrow keys diabled
noremap <up> <Nop>
noremap <right> <nop>
noremap <down> <nop>
noremap <left> <nop>

"Open my vimrc
nnoremap <leader>ev :split $MYVIMRC<cr>
"Source my vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>

"Stop highligthing matches
"nnoremap <esc> :nohlsearch<cr>

map <tab> :NERDTreeToggle<cr>

