if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
" Color and highlight
Plug 'altercation/vim-colors-solarized'
Plug 'jeaye/color_coded', { 'do': 'cmake .' }
" Plug 'octol/vim-cpp-enhanced-highlight'

" Code completion/linting/formatting
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clangd-completer' }
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'godlygeek/tabular'
Plug 'tmsvg/pear-tree'
Plug 'dpc/vim-smarttabs'

" Auxiliary
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" File/buffer management
Plug 'scrooloose/nerdtree'
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
set guifont=DejaVu\ Sans\ Mono\ 12
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
set ignorecase
set smartcase
set cino=:0,g0,L0
set backspace=indent,eol,start

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ }

nmap ff :NERDTreeToggle<CR>
nmap tt :TagbarToggle<CR>
nmap F <Plug>(easymotion-prefix)
nmap S <Plug>(easymotion-prefix)s

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
let g:ycm_key_invoke_completion = '<C-b>'

