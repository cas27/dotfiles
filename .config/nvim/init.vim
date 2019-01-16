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
call dein#add('drewtempelmeyer/palenight.vim')
call dein#add('sonph/onehalf', {'rtp': 'vim'})
call dein#add('scrooloose/nerdtree')
call dein#add('slashmili/alchemist.vim')
call dein#add('Shougo/deoplete.nvim')
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
call dein#add('mklabs/split-term.vim')
call dein#add('Lokaltog/powerline-fonts')
call dein#add('SirVer/ultisnips')
call dein#add('honza/vim-snippets')
call dein#add('powerman/vim-plugin-AnsiEsc')
call dein#add('chrisbra/Colorizer')
call dein#add('ryanoasis/vim-devicons')
call dein#add('neomake/neomake')
"call dein#add('ludovicchabant/vim-gutentags')
"call dein#add('zhaocai/GoldenView.Vim')
call dein#add('vimwiki/vimwiki.git')
call dein#add('KabbAmine/zeavim.vim')
call dein#add('cloudhead/neovim-fuzzy')
"call dein#add('majutsushi/tagbar')
call dein#add('MattesGroeger/vim-bookmarks')
call dein#add('wsdjeg/FlyGrep.vim')
call dein#add('jsfaint/gen_tags.vim')
call dein#add('tpope/vim-commentary')

" If there are uninstalled bundles found on startup,
" this will conveniently install them.
if dein#check_install()
    call dein#install()
    let pluginsExist=1
endif

" Required:
call dein#end()
call dein#save_state()

" Required:
filetype plugin indent on

"End dein Scripts-------------------------
"

let mapleader = " "

" Alchemist Config
let g:alchemist_iex_term_size = 30
let g:alchemist_tag_disable = 1

"Airline Config
let g:airline_powerline_fonts = 1
set hidden
let g:Powerline_symbols = 'fancy'
let g:airline_left_alt_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_theme='onehalfdark'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
tmap <leader>1  <C-\><C-n><Plug>AirlineSelectTab1
tmap <leader>2  <C-\><C-n><Plug>AirlineSelectTab2
tmap <leader>3  <C-\><C-n><Plug>AirlineSelectTab3
tmap <leader>4  <C-\><C-n><Plug>AirlineSelectTab4
tmap <leader>5  <C-\><C-n><Plug>AirlineSelectTab5
tmap <leader>6  <C-\><C-n><Plug>AirlineSelectTab6
tmap <leader>7  <C-\><C-n><Plug>AirlineSelectTab7
tmap <leader>8  <C-\><C-n><Plug>AirlineSelectTab8
tmap <leader>9  <C-\><C-n><Plug>AirlineSelectTab9
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

" TagBar
let g:tagbar_type_elixir = {
    \ 'ctagstype' : 'elixir',
    \ 'kinds' : [
        \ 'f:functions',
        \ 'functions:functions',
        \ 'c:callbacks',
        \ 'd:delegates',
        \ 'e:exceptions',
        \ 'i:implementations',
        \ 'a:macros',
        \ 'o:operators',
        \ 'm:modules',
        \ 'p:protocols',
        \ 'r:records',
        \ 't:tests'
    \ ]
\ }

" Deoplete Conf
let g:deoplete#enable_at_startup = 1

" Gutentags Conf
let g:gutentags_cache_dir = '~/.tags_cache'

" Neomake Conf
let g:neomake_elixir_enabled_makers = ['credo']
autocmd! BufWritePost * Neomake

" UltiNipsConf
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "snips"]

" Neovim Conf
set guifont=FuraCode\ Nerd\ Font\ Mono\ 13
set clipboard+=unnamedplus
if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

if (has("termguicolors"))
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" NerdTREE Conf
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 20
let NERDTreeMinimalUI=1

syntax on
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
set number
set autoindent
set smartindent
set autoread
set scrolloff=5
set background=light
set hlsearch "highlight search
set incsearch
set ignorecase smartcase "ignore case when searching
set wrapscan "search from top when hit bottom
set cursorline
set lazyredraw
set noswapfile
"colorscheme palenight
colorscheme onehalflight
hi MatchParen cterm=bold ctermbg=none ctermfg=magenta

"Restore cursor to file position in previous editing session
""http://vim.wikia.com/wiki/Restore_cursor_to_file_position_in_previous_editing_session
"set viminfo='10,\"100,:20,%,n~/.viminfo
" :help last-position-jump
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" Set terminals to split below and right
set splitbelow
set splitright

" Test runner
function! TestRunner(type)
  let ext= expand('%:e')
  let cmd='mix'
  let sub_cmd=''

  if ext == 'rb'
    let cmd = 'rspec'
    let sub_cmd = ' --format doc'
    if executable('bin/rspec')
      let cmd = 'bin/rspec'
    endif
  elseif ext == 'exs'
    let cmd = 'mix test'
  endif

  if a:type == 'file'
    let path=expand('%')
    if finddir('apps', -1) == 'apps'
      let path=join(split(path, '/')[2:10000], '/')
    endif
    let exec_cmd = 'terminal ' . cmd . ' ' . path . ' ' . sub_cmd
    execute(':noremap <leader>tt :' . exec_cmd . '<CR>')
    execute(exec_cmd)
  elseif a:type == 'line'
    let path=expand('%')
    if finddir('apps', -1) == 'apps'
      let path=join(split(path, '/')[2:10000], '/')
    endif
    let exec_cmd = 'terminal ' . cmd . ' ' . path . ':' . line('.') . sub_cmd
    execute(':noremap <leader>tt :' . exec_cmd . '<CR>')
    execute(exec_cmd)
  else
    execute('terminal ' . cmd . ' --format progress')
  endif
endfunction

noremap <c-p> :FuzzyOpen<CR>
noremap <leader>S :FuzzyGrep 
noremap <leader>s :FlyGrep<CR>
noremap <leader>f :NERDTreeToggle<CR>
noremap <leader>t :terminal mix test<CR>
noremap <leader>tf :call TestRunner("file")<CR>
noremap <leader>tl :call TestRunner("line")<CR>
noremap <leader>x :bd!<CR>
noremap <leader>i :IEx<CR>
noremap <leader>a :Ack
noremap <leader><CR> :noh<CR>
inoremap fd <Esc>
set pastetoggle=<F2>
noremap <leader>q :bd<CR>
map <Leader>p :call dein#update()<CR>


" Switch between the last two files
nnoremap <leader><leader> <c-^> :syntax reset<CR>:syntax on<CR>

" To save, ctrl-s.
nnoremap <c-s> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR> :w<CR>
imap <c-s> <Esc> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR> :w<CR>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove<cr>

" Autoformat Elixir files on save
"autocmd BufWritePost *.exs silent :!mix format %
"autocmd BufWritePost *.ex silent :!mix format %
autocmd BufWritePost *.exs silent :e
autocmd BufWritePost *.ex silent :e
