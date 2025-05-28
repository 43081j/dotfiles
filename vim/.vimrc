call plug#begin('~/.vim/plugged')

Plug 'VundleVim/Vundle.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'justinmk/vim-dirvish'
Plug 'flazz/vim-colorschemes'
Plug 'tpope/vim-fugitive'
Plug 'rbong/vim-flog'
Plug 'airblade/vim-gitgutter'
Plug 'groenewege/vim-less'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline-themes'
Plug 'editorconfig/editorconfig-vim'
Plug 'Shougo/vimproc.vim'
Plug 'junegunn/fzf.vim'
Plug 'chriskempson/base16-vim'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-unimpaired'
Plug 'omnisharp/omnisharp-vim'
Plug 'dracula/vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'github/copilot.vim'

call plug#end()

set rtp+=~/.fzf

filetype plugin indent on
syntax on

set nocompatible
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
set directory=$HOME/.vim/swap

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
let g:fzf_command_prefix = 'Fzf'
let g:OmniSharp_selector_ui = 'fzf'
let g:OmniSharp_server_use_net6 = 1
let $BAT_THEME = 'Dracula'

if has('mac')
  colorscheme dracula
elseif has('win32')
  colorscheme desert
else
  colorscheme dracula
endif

" Bindings

nnoremap <c-p> :FzfFiles<CR>
nnoremap <silent> <leader>a :FzfBuffers<CR>
nnoremap <silent> <leader>/ :execute 'FzfRg ' . input('Rg/')<CR>
nnoremap <silent> <leader>gl :FzfCommits<CR>
nnoremap <silent> <leader>gc :FzfBCommits<CR>
nnoremap <silent> <leader>gf :FzfGFiles<CR>
inoremap <expr> <c-x><c-f> fzf#vim#complete#path('fd')

" Crazy ast-grep bindings in vim
command! -bang -nargs=* FzfSg call fzf#vim#grep("sg run --heading=never --color=always --pattern=".fzf#shellescape(<q-args>)." | awk -F ':' '!seen[$1]++'", fzf#vim#with_preview(), <bang>0)
nnoremap <silent> <leader>sg :execute 'FzfSg ' . input('sg/')<CR>

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" Coc bindings
nmap <silent> <c-]> <Plug>(coc-definition)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> <C-^> <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>ac <Plug>(coc-codeaction-cursor)
nmap <leader>as <Plug>(coc-codeaction-source)
nnoremap <silent> K :call CocActionAsync('doHover')<CR>

inoremap <silent><expr> <c-@> coc#refresh()
inoremap <silent><expr> <c-j> coc#pum#visible() ? coc#pum#next(1) : ''
inoremap <silent><expr> <c-k> coc#pum#visible() ? coc#pum#prev(1) : ''
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

command VLeftDirvish leftabove vsplit | vertical resize 50 | silent Dirvish
nnoremap <C-n> :VLeftDirvish<CR>
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_winsize = 25
let g:netrw_browse_split = 4

function! RunAstGrepOnBuffer()
  let l:input = input('sg/')
  if l:input == ''
    echo "No input provided"
    return
  endif
  let l:parts = split(l:input, '/')
  if len(l:parts) != 2
    echoerr "Invalid input format. Expected 'searchPattern/replacePattern'"
    return
  endif
  let l:searchPattern = l:parts[0]
  let l:replacePattern = l:parts[1]
  let l:command = 'sg run --lang=typescript --heading=never --color=never --stdin -U -p ' . shellescape(l:searchPattern) . ' -r ' . shellescape(l:replacePattern) . ''
  let l:output = system(l:command, join(getbufline('%', 1, '$'), "\n"))
  if v:shell_error
    echoerr "Error running ast-grep: " . l:output
    return
  endif
  let l:output_lines = split(l:output, "\n")[0:-3]

  call setline(1, output_lines)
endfunction

nnoremap <leader>bsg :call RunAstGrepOnBuffer()<CR>

" Filetypes

au BufRead,BufNewFile *.md set filetype=markdown

if has('python3')
  augroup omnisharp_commands
    autocmd!

    autocmd FileType cs nmap <silent> <buffer> gd <Plug>(omnisharp_go_to_definition)
    autocmd FileType cs nmap <silent> <buffer> <c-]> <Plug>(omnisharp_go_to_definition)
    autocmd FileType cs nmap <silent> <buffer> <c-^> <Plug>(omnisharp_find_usages)
    autocmd FileType cs nmap <silent> <buffer> <Leader>osca <Plug>(omnisharp_code_actions)
  augroup END
endif

if executable('prettier')
  autocmd FileType javascript,typescript set formatprg=prettier\ --stdin
endif
