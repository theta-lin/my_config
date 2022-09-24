if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Color and highlight
Plug 'altercation/vim-colors-solarized'
" Plug 'jeaye/color_coded', { 'do': 'cmake .' }
" Plug 'octol/vim-cpp-enhanced-highlight'

" Code completion/linting/formatting
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clangd-completer' }
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'godlygeek/tabular'
Plug 'tmsvg/pear-tree'
Plug 'Thyrum/vim-stabs'

" Latex
Plug 'lervag/vimtex'

" File/buffer management
Plug 'jlanzarotta/bufexplorer'
Plug 'vim-scripts/a.vim'
Plug 'majutsushi/tagbar'

" Action
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'

" Searching
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'jremmen/vim-ripgrep'

" Status line
Plug 'itchyny/lightline.vim'

" Drawing
Plug 'vim-scripts/DrawIt'

" Git
Plug 'tpope/vim-fugitive'

" CMake
Plug 'vhdirk/vim-cmake'

" Orgmode
Plug 'jceb/vim-orgmode'
Plug 'mattn/calendar-vim'
Plug 'tpope/vim-speeddating'

" Terminal
Plug 'wincent/terminus'
call plug#end()

set encoding=utf-8

set guifont=DejaVu\ Sans\ Mono\ 10
set t_Co=256
let g:solarized_termtrans=1
syntax enable
set background=dark
colorscheme solarized

set noshowmode
set number
set cursorline
set cursorcolumn
set colorcolumn=80
set tabstop=4
set shiftwidth=4
set laststatus=2

set cino=:0,g0,L0
set backspace=indent,eol,start
set noexpandtab

set hlsearch
set incsearch
set ignorecase
set smartcase

set spell
set spelllang=en,cjk
set dict+=/usr/share/dict/words
set complete+=k
set diffopt+=icase

autocmd! InsertEnter * call feedkeys("\<Cmd>noh\<cr>" , 'n')

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

let g:netrw_liststyle=3
let g:netrw_banner=0
let g:netrw_list_hide='\(^\|\s\s\)\zs\.\S\+'

let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ }

nnoremap <BS> {
onoremap <BS> {
vnoremap <BS> {
nnoremap <expr> <CR> empty(&buftype) ? '}' : '<CR>'
onoremap <expr> <CR> empty(&buftype) ? '}' : '<CR>'
vnoremap <CR> }

vnoremap < <gv
vnoremap > >gv

if v:version > 703 || v:version == 703 && has('patch541')
	set formatoptions+=j
endif

autocmd FileType c,cpp,java,php autocmd BufWritePre <buffer> %s/\s\+$//e
nmap <F7> :setlocal spell! spelllang=en_us<CR>
imap <F7> <Esc>:setlocal spell! spelllang=en_us<CR>i

let g:pear_tree_repeatable_expand=0

let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf=0
let g:ycm_autoclose_preview_window_after_insertion=1
"let g:ycm_key_invoke_completion = '<C-b>'
let g:ycm_enable_semantic_highlighting=1

let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
set conceallevel=1
let g:tex_conceal='abdmg'
