autoload vim script from .vim

# Usage

create directory `.vim/`, write code on `.vim/autoload.vim` .

example:

```vim
set tabstop=2
echomsg 'config loaded'
```

# Config

If you only want to load once, create `.vim/config.json` file:
```json
{"only_load_once":1}
```

You can change `.vim`,`autoload.vim`,`config.json` to another name.

default config:

```vim
let g:dotvim_dir = '.vim'
let g:dotvim_autoload_file = 'autoload.vim'
let g:dotvim_config_file = 'config.json'
let g:dotvim_autoload_on_dir_changed = 1
let g:dotvim_autoload_on_buf_enter = 1
```
