if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'jlanzarotta/bufexplorer'
Plug 'tmsvg/pear-tree'
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'godlygeek/tabular'
Plug 'vim-scripts/a.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-scripts/DrawIt'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'jremmen/vim-ripgrep'
Plug 'vhdirk/vim-cmake'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clangd-completer' }
Plug 'jeaye/color_coded', { 'do': 'cmake .' }
" Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'majutsushi/tagbar'
Plug 'jceb/vim-orgmode'
Plug 'mattn/calendar-vim'
Plug 'tpope/vim-speeddating'
Plug 'wincent/terminus'
call plug#end()

set encoding=utf-8
set guifont=Consolas:h15

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

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

let g:airline_theme='solarized'
let g:airline#extensions#whitespace#mixed_indent_algo = 2

set backspace=indent,eol,start

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

let g:pear_tree_repeatable_expand=0

let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf=0
let g:ycm_autoclose_preview_window_after_insertion=1
let g:ycm_key_invoke_completion = '<C-b>'

