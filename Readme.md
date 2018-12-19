# coc-neoinclude

Include completon source for [coc.nvim](https://github.com/neoclide/coc.nvim) using
[neoinclude.vim](https://github.com/Shougo/neoinclude.vim)

**Note:** this source invode vim function that could be quite slow, so make sure
your `coc.preferences.timeout` is not too low, otherwise it may timeout.

## Install

For vim-plug user, add:

```
Plug 'Shougo/neoinclude.vim'
Plug 'jsfaint/coc-neoinclude'
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
```

to your `.vimrc` and run `:PlugInstall`

## LICENSE

MIT
