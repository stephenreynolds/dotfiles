" Set leader to space
noremap <SPACE> <Nop>
let mapleader = " "

" Indents
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set autoindent

" Numbers
set guicursor=
set number
set relativenumber
set mouse=a

" Misc settings
set exrc
set nu
set nohlsearch
set hidden
set noerrorbells
set nowrap
set ignorecase
set smartcase
set noshowmode

" Disable swapfile and stuff
set noswapfile
set nobackup
set undodir=~/.config/nvim/undodir
set undofile

set incsearch
set termguicolors
set scrolloff=8

" Columns
set colorcolumn=80,120
set signcolumn=yes

" Remaps
map <leader>a ggVG
map <leader>ut :UndotreeToggle<CR>
nnoremap <leader>v <cmd>CHADopen<CR>
nnoremap <leader>l <cmd>call setqflist([])<CR>
nnoremap <silent> <leader>gg :LazyGit<CR>

" Plugins
call plug#begin('~/.vim/plugged')
    " Themes
    Plug 'rebelot/kanagawa.nvim'
    Plug 'catppuccin/nvim', {'as': 'catppuccin' }

    " Features
    Plug 'nvim-lualine/lualine.nvim'
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
    Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
    Plug 'ms-jpq/coq.thirdparty', {'branch': '3p'}
    Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
    Plug 'kdheepak/lazygit.nvim'
    Plug 'williamboman/mason.nvim'
    Plug 'williamboman/mason-lspconfig.nvim'
    Plug 'neovim/nvim-lspconfig'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-telescope/telescope-project.nvim'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'},
    Plug 'mbbill/undotree',
    Plug 'tpope/vim-fugitive'
call plug#end()

" Plugin configs
lua require("stephen")

" Color scheme
colorscheme kanagawa
highlight Normal guibg=none
