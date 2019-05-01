call plug#begin('/.vim/plugged')
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'tmsvg/pear-tree'
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-repeat'
Plug 'godlygeek/tabular'
Plug 'vim-scripts/a.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'jlanzarotta/bufexplorer'
Plug 'vitalk/vim-simple-todo'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'vhdirk/vim-cmake'
Plug 'Valloric/YouCompleteMe', { 'do': 'install.py --clangd-completer' }
Plug 'jeaye/color_coded'
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'majutsushi/tagbar'
call plug#end()

set encoding=utf-8
set guifont=Consolas:h16
syntax enable
set background=dark
colorscheme solarized
set noshowmode
let g:airline_theme='solarized'

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

set backspace=indent,eol,start
let g:pear_tree_repeatable_expand=0
nmap ff :NERDTreeToggle<CR>
nmap tt :TagbarToggle<CR>
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
