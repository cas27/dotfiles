" Test runner
function! TestRunner(type)
  let ext= expand('%:e')
  let cmd='mix'
  let sub_cmd=''

  if ext == 'rb'
    let cmd = 'bundle exec rspec'
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
    let exec_cmd = 'FloatermNew ' . cmd . ' ' . path . ' ' . sub_cmd
    execute(':noremap <leader>tt :' . exec_cmd . '<CR>')
    execute(exec_cmd)
  elseif a:type == 'line'
    let path=expand('%')
    if finddir('apps', -1) == 'apps'
      let path=join(split(path, '/')[2:10000], '/')
    endif
    let exec_cmd = 'FloatermNew ' . cmd . ' ' . path . ':' . line('.') . sub_cmd
    execute(':noremap <leader>tt :' . exec_cmd . '<CR>')
    execute(exec_cmd)
  else
    execute('terminal ' . cmd . ' --format progress')
  endif
endfunction

" Elixir LS Builder
let g:ElixirLS = {}
let ElixirLS.path = stdpath('config').'/autoload/plugged/elixir-ls'
let ElixirLS.lsp = ElixirLS.path.'/release/language_server.sh'
let ElixirLS.cmd = join([
        \ 'mix do',
        \ 'local.hex --force --if-missing,',
        \ 'local.rebar --force,',
        \ 'deps.get,',
        \ 'compile,',
        \ 'elixir_ls.release &&',
        \ 'rm .tool-versions'
        \ ], ' ')

function ElixirLS.on_stdout(_job_id, data, _event)
  let self.output[-1] .= a:data[0]
  call extend(self.output, a:data[1:])
endfunction

let ElixirLS.on_stderr = function(ElixirLS.on_stdout)

function ElixirLS.on_exit(_job_id, exitcode, _event)
  if a:exitcode[0] == 0
    echom '>>> ElixirLS compiled'
  else
    echoerr join(self.output, ' ')
    echoerr '>>> ElixirLS compilation failed'
  endif
endfunction

function ElixirLS.compile()
  let me = copy(g:ElixirLS)
  let me.output = ['']
  echom '>>> compiling ElixirLS'
  let me.id = jobstart('cd ' . me.path . ' && git pull && ' . me.cmd, me)
endfunction
