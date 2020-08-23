" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

  Plug 'ryanoasis/vim-devicons'                         " adds cool icons to file types
  Plug 'sheerun/vim-polyglot'                           " syntax support for all the languages
  Plug 'jiangmiao/auto-pairs'                           " Auto pairs for '(' '[' '{'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }   " searching all the things
  Plug 'junegunn/fzf.vim'                               " searching all the things
  Plug 'liuchengxu/vim-which-key'                       " see your key bindings
  Plug 'voldikss/vim-floaterm'                          " floating term
  Plug 'vimwiki/vimwiki'                                " wiki for all my things
  Plug 'mg979/vim-xtabline'                             " better tabline up top
  Plug 'vim-airline/vim-airline'                        " status line
  Plug 'vim-airline/vim-airline-themes'                 " airline themes
  Plug 'tpope/vim-fugitive'                             " git
  Plug 'psliwka/vim-smoothie'                           " smooth ctrl-d ctrl-u
  Plug 'elixir-lsp/elixir-ls', { 'do': { -> g:ElixirLS.compile() } }
  Plug 'neoclide/coc.nvim', {'branch': 'release'}       " Intellisense engine
  Plug 'tpope/vim-commentary'                           " comment code lines
  Plug 'honza/vim-snippets'                             " snippets
  Plug 'justinmk/vim-sneak'                             " Text Navigation
  Plug 'stsewd/fzf-checkout.vim'                        " Checkout branches with fzf

  " themes
  Plug 'morhetz/gruvbox'
  Plug 'sonph/onehalf', {'rtp': 'vim'}
  Plug 'reedes/vim-colors-pencil'
call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
