call plug#begin()
 Plug 'dracula/vim'
 Plug 'ryanoasis/vim-devicons'
 Plug 'SirVer/ultisnips'
 Plug 'honza/vim-snippets'
 Plug 'scrooloose/nerdtree'
 Plug 'preservim/nerdcommenter'
 Plug 'mhinz/vim-startify'
 Plug 'neoclide/coc.nvim', {'branch': 'release'}
 Plug 'projekt0n/github-nvim-theme'
call plug#end()

set number
set showmatch
set ignorecase
set hlsearch
set tabstop=4
set expandtab
set shiftwidth=4
set autoindent
set wildmode=longest, list
set cc=80
set mouse=a
set cursorline
set ttyfast
set noswapfile
set backupdir=~/.cache/nvim
set clipboard+=unnamedplus
colorscheme github_dark

nmap <F6> :NERDTreeToggle<CR>
