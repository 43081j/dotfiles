set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'gregsexton/gitv'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'flazz/vim-colorschemes'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'pangloss/vim-javascript'
Plugin 'groenewege/vim-less'
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'Quramy/tsuquyomi'
Plugin 'Shougo/vimproc.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'rust-lang/rust.vim'

call vundle#end()

filetype plugin indent on
syntax on

set visualbell
set laststatus=2
set tabstop=4
set shiftwidth=4
set nu
set diffopt+=vertical
set cursorline
set hlsearch
set scrolloff=5
set cc=80
set nobackup

let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -oc --exclude-standard']
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

au BufRead,BufNewFile *.md set filetype=markdown
