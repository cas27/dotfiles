set nocompatible
filetype off

"Setup dein  ---------------------------------------------------------------
if (!isdirectory(expand("$HOME/.config/nvim/bundle/dein.vim")))
  call system(expand("git clone https://github.com/Shougo/dein.vim $HOME/.config/nvim/bundle/dein.vim"))
endif

set runtimepath+=~/.config/nvim/bundle/dein.vim/
" Required:
call dein#begin("~/.config/nvim/bundle/")
call dein#add('Shougo/dein.vim')

" Add or remove your Bundles here:
call dein#add('sheerun/vim-polyglot')
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('tpope/vim-fugitive')
call dein#add('ctrlpvim/ctrlp.vim')
call dein#add('flazz/vim-colorschemes')
call dein#add('scrooloose/nerdtree')
call dein#add('slashmili/alchemist.vim')
call dein#add('Shougo/deoplete.nvim')
call dein#add('vim-airline/vim-airline')
call dein#add('mklabs/split-term.vim')
call dein#add('Lokaltog/powerline-fonts')
call dein#add('SirVer/ultisnips')
call dein#add('honza/vim-snippets')
call dein#add('powerman/vim-plugin-AnsiEsc')
call dein#add('chrisbra/Colorizer')
call dein#add('ryanoasis/vim-devicons')

" If there are uninstalled bundles found on startup,
" this will conveniently install them.
if dein#check_install()
    call dein#install()
    let pluginsExist=1
endif

" Required:
call dein#end()

" Required:
filetype plugin indent on

"End dein Scripts-------------------------
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

" Neovim Conf
set termguicolors

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
hi MatchParen cterm=bold ctermbg=none ctermfg=magenta
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete\ 12

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
