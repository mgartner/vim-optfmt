# vim-optfmt

Vim plugin for `optfmt`. Implementation heavily borrowed from
[vim-crlfmt](https://github.com/irfansharif/vim-crlfmt).

The plugin by default will format `*.opt` files on save. Under the hood it uses
[optfmt](https://github.com/cockroachdb/cockroach/blob/master/pkg/sql/opt/optgen/cmd/optfmt/main.go)
to process the files.

## Usage

Save the file or call `:OptFmt`.

```vim
" Turn off autosave formatting
g:optfmt_autosave = 0 [default = 1]

" Don't display error message if optfmt fails
g:optfmt_fail_silently = 1 [default = 0]
```

## Install

Vim-optfmt follows the standard runtime path structure. For Pathogen just clone
the repo. For other plugin managers add the appropriate lines and execute the
plugin's install command.

*  [Pathogen](https://github.com/tpope/vim-pathogen)
  * `git clone https://github.com/mgartner/vim-optfmt.git ~/.vim/bundle/vim-optfmt`
*  [vim-plug](https://github.com/junegunn/vim-plug)
  * `Plug 'mgartner/vim-optfmt'`
*  [NeoBundle](https://github.com/Shougo/neobundle.vim)
  * `NeoBundle 'mgartner/vim-optfmt'`
*  [Vundle](https://github.com/gmarik/vundle)
  * `Plugin 'mgartner/vim-optfmt'`
