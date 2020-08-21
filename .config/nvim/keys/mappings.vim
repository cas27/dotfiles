let mapleader=" "
nnoremap <Space> <Nop>

inoremap fd <Esc>
noremap <leader>d :put=strftime('%a, %b %d, %Y')<CR>

" Switch between the last two files
nnoremap <leader><leader> <c-^><CR>

noremap <leader><CR> :noh<CR>

" Test Runner
noremap <leader>tf :call TestRunner("file")<CR>
noremap <leader>tl :call TestRunner("line")<CR>

" TAB in general mode will move to text buffer
nnoremap <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <S-TAB> :bprevious<CR>

" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
