if exists('g:dotvim_plugin_loaded')
	finish
endif
let g:dotvim_plugin_loaded = 1

if !exists('g:dotvim_dir')
	let g:dotvim_dir = '.vim'
endif

if !exists('g:dotvim_autoload_file')
	let g:dotvim_autoload_file = 'autoload.vim'
endif

if !exists('g:dotvim_config_file')
	let g:dotvim_config_file = 'config.json'
endif

if !exists('g:dotvim_autoload_on_dir_changed')
	let g:dotvim_autoload_on_dir_changed = 1
endif

if !exists('g:dotvim_autoload_on_buf_enter')
	let g:dotvim_autoload_on_buf_enter = 1
endif

if !exists('g:dotvim_only_load_once')
	let g:dotvim_only_load_once = {}
endif

function! s:dotvim_autoload_on_dir_changed() abort
	call dotvim#autoload('.')
endfunction

if g:dotvim_autoload_on_dir_changed == 1
	autocmd DirChanged * call s:dotvim_autoload_on_dir_changed()
endif

function! s:dotvim_autoload_on_buf_enter() abort
	let dir = expand('%:p:h')
	call dotvim#autoload(dir)
endfunction

if g:dotvim_autoload_on_buf_enter == 1
	autocmd BufEnter * call s:dotvim_autoload_on_buf_enter()
endif
