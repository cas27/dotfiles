set nocompatible
filetype off

"NeoBundle Scripts-----------------------------
if has('vim_starting')
  " Required:
  set runtimepath+=/home/corys/.config/nvim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('/home/corys/.config/nvim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'elixir-lang/vim-elixir'
NeoBundle 'slashmili/alchemist.vim'
NeoBundle 'Shougo/deoplete.nvim'
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'mklabs/split-term.vim'
NeoBundle 'Lokaltog/powerline-fonts'
NeoBundle 'SirVer/ultisnips'
NeoBundle 'honza/vim-snippets'
NeoBundle 'powerman/vim-plugin-AnsiEsc'
NeoBundle 'cespare/vim-toml'


" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------
"
let g:alchemist_iex_term_size = 30

"Airline Config
let g:airline_powerline_fonts = 1
let g:Powerline_symbols = 'fancy'
let g:airline_left_alt_sep = ''
let g:airline_right_alt_sep = ''

" UltiNipsConf
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "snips"]

" Deoplete Conf
let g:deoplete#enable_at_startup = 1
" Scroll suggestions with j/k
inoremap <expr> j ((pumvisible())?("\<C-n>"):("j"))
inoremap <expr> k ((pumvisible())?("\<C-p>"):("k"))

syntax on
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
set number
set autoindent
set autoread
set scrolloff=5
set background=dark
set hlsearch "highlight search 
set incsearch
set wrapscan "search from top when hit bottom
set cursorline
colorscheme molokai
let mapleader = " "

"Restore cursor to file position in previous editing session
""http://vim.wikia.com/wiki/Restore_cursor_to_file_position_in_previous_editing_session
"set viminfo='10,\"100,:20,%,n~/.viminfo
" :help last-position-jump
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

map <Leader>b :CtrlPBuffer<CR>
let g:ctrlp_working_path_mode = 0
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v\c(node_modules|_build|deps|vendor|\.git|\.svn)$',
    \ 'file': '\v\c\.(swf|bak|png|gif|mov|ico|jpg|pdf|jrxml)$',
    \}

" Set terminals to split below
set splitbelow

noremap <leader>f :NERDTreeToggle<CR>
noremap <leader>t :Term mix test<CR>
inoremap fd <Esc>

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" To save, ctrl-s.
nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>a

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove<cr>
