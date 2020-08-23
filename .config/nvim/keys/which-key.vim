" Map leader to which_key
nnoremap <silent> <leader> :silent <c-u> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

" Create map to add keys to
let g:which_key_map =  {}
" Define a separator
let g:which_key_sep = '→'

" Not a fan of floating windows for this
let g:which_key_use_floating_win = 0

" Change the colors if you want
highlight default link WhichKey          Operator
highlight default link WhichKeySeperator DiffAdded
highlight default link WhichKeyGroup     Identifier
highlight default link WhichKeyDesc      Function

" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

" Single mappings
let g:which_key_map['p'] = [ ':Files'                             , 'search files' ]
let g:which_key_map['s'] = [ ':Rg'                                , 'search text' ]
let g:which_key_map['x'] = [ ':XTabCloseBuffer'                   , 'close buffer' ]
let g:which_key_map['f'] = [ ':CocCommand explorer'               , 'file explorer' ]

" Group mappings
"
" t is for terminal
let g:which_key_map.t = {
      \ 'name' : '+terminal' ,
      \ ';' : [':FloatermNew --wintype=popup --height=6'        , 'terminal'],
      \ 'f' : [':FloatermNew fzf'                               , 'fzf'],
      \ 'g' : [':FloatermNew lazygit'                           , 'git'],
      \ 'r' : [':FloatermNew ranger'                            , 'ranger'],
      \ }

" g is for git
let g:which_key_map.g = {
      \ 'name' : '+terminal' ,
      \ 'a' : [':Git add .'        , 'add all'],
      \ 'b' : [':Git blame'        , 'blame'],
      \ 'c' : [':GCheckout'        , 'checkout'],
      \ 's' : [':G'                , 'status'],
      \ 'l' : [':Git log'          , 'log'],
      \ 'C' : [':Git commit'       , 'commit'],
      \ 'p' : [':Git push'         , 'push'],
      \ 'P' : [':Git pull'         , 'pull'],
      \ }

" Register which key map
call which_key#register('<Space>', "g:which_key_map")
