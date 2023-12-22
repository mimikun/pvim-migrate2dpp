set nocompatible

" Set dpp base path (required)
const s:dpp_base = '~/.cache/paleovim/dpp/'
const s:dpp_github = '~/.cache/paleovim/dpp/repos/github.com'

" Set dpp config TypeScript file path (required)
const s:dpp_config = '~/.vim/dpp.ts'

" Set dpp source path (required)
const s:dpp_src = '~/.cache/paleovim/dpp/repos/github.com/Shougo/dpp.vim'
const s:denops_src = '~/.cache/paleovim/dpp/repos/github.com/vim-denops/denops.vim'

" Set dpp extension path (optional)
"const s:ext_example = '~/.cache/paleovim/dpp/repos/github.com/USERNAME/REPONAME'
const s:ext_toml = '~/.cache/paleovim/dpp/repos/github.com/Shougo/dpp-ext-toml'
const s:ext_lazy = '~/.cache/paleovim/dpp/repos/github.com/Shougo/dpp-ext-lazy'
const s:ext_installer = '~/.cache/paleovim/dpp/repos/github.com/Shougo/dpp-ext-installer'
const s:ext_local = '~/.cache/paleovim/dpp/repos/github.com/Shougo/dpp-ext-local'

" Set dpp protocol path (optional)
" NOTE: It's the 21st century, so it's usually just git.
"const s:protocol_example = '~/.cache/paleovim/dpp/repos/github.com/USERNAME/REPONAME'
const s:protocol_git = '~/.cache/paleovim/dpp/repos/github.com/Shougo/dpp-protocol-git'

" Set dpp runtime path (required)
execute 'set runtimepath^=' .. s:dpp_src

if s:dpp_base->dpp#min#load_state()
    " NOTE: dpp#make_state() requires denops.vim
    execute 'set runtimepath^=' .. s:denops_src
    autocmd User DenopsReady
    \ call dpp#make_state(s:dpp_base, s:dpp_config)
endif

filetype indent plugin on

if has('syntax')
    syntax on
endif
