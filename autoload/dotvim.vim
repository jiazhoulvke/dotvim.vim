function! dotvim#read_config(dir) abort
	let config_file = findfile(g:dotvim_config_file, a:dir)
	if config_file == ''
		return {}
	endif
	if !filereadable(config_file)
		return {}
	endif
	let config_data = readfile(config_file)
	if len(config_data) == 0
		return {}
	endif
	let config = json_decode(join(config_data, "\n"))
	if type(config) != v:t_dict
		return {}
	endif
	return config
endfunction

function dotvim#autoload(dir) abort
	let dotvim_dir = finddir(g:dotvim_dir, a:dir.';')
	if dotvim_dir == ''
		return
	endif
	let dotvim_dir = fnamemodify(dotvim_dir, ':p')
	if has_key(g:dotvim_only_load_once, dotvim_dir)
		return
	endif
	let config = dotvim#read_config(dotvim_dir)
	if has_key(config, 'only_load_once') && config['only_load_once'] == 1
		let g:dotvim_only_load_once[dotvim_dir] = 1
	endif
	let autoload_file = findfile(g:dotvim_autoload_file, dotvim_dir)
	if autoload_file == ''
		return
	endif
	if filereadable(autoload_file)
		exec 'source '.autoload_file
	endif
endfunction
