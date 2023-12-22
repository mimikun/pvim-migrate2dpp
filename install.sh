#!/bin/bash

dpp_root="$XDG_CACHE_HOME/paleovim/dpp/repos/github.com"

function clone_cmd {
    if command -v pueue >/dev/null 2>&1; then
        pueue add -- "git clone --filter=blob:none $1"
    else
        git clone --filter=blob:none "$1"
    fi
}

function checkmdkir {
    if [ ! -e "$1" ]; then
        mkdir -p "$1"
    fi
}

function checkclone {
    if [ ! -e  "$1" ]; then
        clone_cmd "$1"
    fi
}

checkmdkir "$dpp_root"

cd "$dpp_root" || exit

checkmdkir Shougo
checkmdkir vim-denops

cd Shougo || exit

checkclone https://github.com/Shougo/dpp.vim.git
checkclone https://github.com/Shougo/dpp-protocol-git.git
checkclone https://github.com/Shougo/dpp-ext-installer.git
checkclone https://github.com/Shougo/dpp-ext-lazy.git
checkclone https://github.com/Shougo/dpp-ext-toml.git
checkclone https://github.com/Shougo/dpp-ext-local

cd "$dpp_root" || exit

cd vim-denops || exit

checkclone https://github.com/vim-denops/denops.vim.git

cd "$dpp_root" || exit
