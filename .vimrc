"set encoding=utf-8

" Vim-plug
call plug#begin()
Plug 'airblade/vim-gitgutter'
Plug 'rust-lang/rust.vim'
call plug#end()

" Rust
let g:rustfmt_autosave = 1

" vim-gitgutter
set updatetime=100  " How often to update markers to the left
nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk

set backspace=start,eol,indent

set autoindent
set cindent

" Keep cursor centered
set scrolloff=999

"let g:loaded_matchparen=1

" För att latex-suite ska producera pdf istället för dvi
let g:Tex_DefaultTargetFormat='pdf'

let g:Tex_UseMakefile=1

set langmenu=en_US
let $LANG = 'en_US'
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" Disables error bells
set noerrorbells visualbell t_vb=
if has('autocmd')
	autocmd GUIEnter * set visualbell t_vb=
endif

"" backup to ~/.tmp 
set backup 
set backupdir=~/.vim/backup
set directory=~/.vim/swap
set writebackup

" GUI settings
set t_Co=256
colorscheme wombatsebelino
"colorscheme desert
set background=dark
"set gfn=Consolas:h7
syn on
" set guicursor+=a:blinkon0
set number
set ruler
set nohlsearch

map  <F12> :set hls!<CR>
imap <F12> <ESC>:set hls!<CR>a
vmap <F12> <ESC>:set hls!<CR>gv

map <F11> :set wrap!<CR>

set tabstop=4 shiftwidth=4 softtabstop=4
set textwidth=101
set expandtab
autocmd FileType html,htm setlocal ts=2 sw=2 sts=2

" Shows number of visually selected characters
set showcmd

" Omni completion
filetype plugin on
set omnifunc=syntaxcomplete#Complete

" Vim LaTeX / LaTeX Suite
filetype plugin indent on
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"
" Disable code folding.
let Tex_FoldedSections=""
let Tex_FoldedEnvironments=""
let Tex_FoldedMisc=""
" Disable quickfix annoyance.
let Tex_GotoError=0
let g:Imap_UsePlaceHolders = 0

let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
let g:SuperTabDefaultCompletionType = "context"

" Toggle spell checking on and off with ',s'
let mapleader = ","
nmap <silent> <leader>s :set spell!<CR>
:set spelllang=sv

" Ctrl-j/k deletes blank line below/above, and Alt-j/k inserts.
nnoremap <silent><C-j> m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><C-k> m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><A-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent><A-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>

" Shortcut for :qa and :w
nnoremap <silent><C-i> :qa<CR>
nnoremap <silent><C-s> :w<CR>

" Disables arrow keys.
" inoremap  <Up>     <NOP>
" inoremap  <Down>   <NOP>
" inoremap  <Left>   <NOP>
" inoremap  <Right>  <NOP>
" noremap   <Up>     <NOP>
" noremap   <Down>   <NOP>
" noremap   <Left>   <NOP>
" noremap   <Right>  <NOP>

" Swap the word the cursor is on with the next word (which can be on a
" newline, and punctuation is "skipped"):
nmap <silent> gw "_yiw:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><C-o>:noh<CR>

" Exchange character under cursor with the next character without moving
" the cursor.
nnoremap gc xph

" Inserts spaces to the left and right of the character under the cursor.
nnoremap g<Space> i<Space><Esc>la<Space><Esc>h

" Inserts blank lines above and under the current line.
nnoremap g<CR> mzO<Esc>jo<Esc>`z

" Shorter sudo
cmap w!! w !sudo tee % > /dev/null

" Uncomment the following to have Vim jump to the last position when reopening a file.
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

" Python-mode
let g:pymode_folding = 0
let g:pymode_quickfix_maxheight = 8
let g:pymode_breakpoint = 1
let g:pymode_python = 'python3'
" Disables Pythonmode's syntax checking in favor of Syntastic
"let g:pymode_lint = 0

" Syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"let g:syntastic_python_checkers = ['flake8', 'pyflakes', 'pylint']
let g:syntastic_python_checkers = ['pyflakes']
let g:syntastic_cpp_checkers = ['gcc', 'cpplint']
let g:syntastic_cpp_cpplint_exec = 'cpplint'
let g:syntastic_cpp_cpplint_thres = 0

" Incremental search
set incsearch

" Save-alias
command W w
command Q q
