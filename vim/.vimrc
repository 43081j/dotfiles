set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'gregsexton/gitv'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-airline/vim-airline'
Plugin 'justinmk/vim-dirvish'
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
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'rust-lang/rust.vim'
Plugin 'chriskempson/base16-vim'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-unimpaired'
Plugin 'omnisharp/omnisharp-vim'
Plugin 'dracula/vim'

call vundle#end()

filetype plugin indent on
syntax on

set visualbell
set laststatus=2
set tabstop=2
set shiftwidth=2
set expandtab
set nu
set diffopt+=vertical
set cursorline
set hlsearch
set scrolloff=5
set cc=80
set omnifunc=syntaxcomplete#Complete
set nobackup
set termguicolors
set t_Co=256
set wildmenu

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
let g:fzf_command_prefix = 'Fzf'
let g:OmniSharp_selector_ui = 'fzf'

if has('mac')
	colorscheme dracula
elseif has('win32')
	colorscheme desert
else
	colorscheme default
endif

" Bindings

nnoremap <c-p> :FzfGFiles<CR>
nnoremap <silent> <leader>a :FzfBuffers<CR>
nnoremap <silent> <leader>/ :execute 'FzfAg ' . input('Ag/')<CR>
nnoremap <silent> <leader>gl :FzfCommits<CR>
nnoremap <silent> <leader>gf :FzfBCommits<CR>

" Filetypes

au BufRead,BufNewFile *.md set filetype=markdown
autocmd FileType dirvish call fugitive#detect(@%)

if has('python3')
	augroup omnisharp_commands
		autocmd!
    autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()
		autocmd FileType cs setlocal omnifunc=OmniSharp#Complete
		autocmd FileType cs nnoremap <buffer> <C-]> :OmniSharpGotoDefinition<cr>
		autocmd FileType cs nnoremap <buffer> gd :OmniSharpGotoDefinition<cr>
	augroup END
endif

if executable('prettier')
	autocmd FileType javascript set formatprg=prettier\ --stdin
endif
