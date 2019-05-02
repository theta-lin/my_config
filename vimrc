call plug#begin('/.vim/plugged')
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
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'vhdirk/vim-cmake'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clangd-completer' }
" Plug 'jeaye/color_coded', { 'do': 'cmake .' }
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'majutsushi/tagbar'
call plug#end()

set encoding=utf-8
set guifont=Consolas:h15
syntax enable
set background=dark
colorscheme solarized
set noshowmode
set number
set cursorline
set cursorcolumn
set colorcolumn=80

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

let g:airline_theme='solarized'

set backspace=indent,eol,start

nmap ff :NERDTreeToggle<CR>
nmap tt :TagbarToggle<CR>
nmap b <Plug>(easymotion-prefix)
nmap B <Plug>(easymotion-prefix)s

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
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
