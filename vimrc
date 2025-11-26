vim9script
# ==============================
#   Vim 9.0 Single-File Setup
# ==============================

# ----- Bootstrap vim-plug -----
if !filereadable(expand('~/.vim/autoload/plug.vim'))
  silent execute '!curl -fLo ~/.vim/autoload/plug.vim --create-dirs '
        .. 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  echom "→ Installed vim-plug successfully"
endif

# ----- Plugin definitions -----
call plug#begin('~/.vim/plugged')

# coc
# Need to run :CocInstall coc-clangd in vim
Plug 'neoclide/coc.nvim', {'branch':'release'}

# copilot
Plug 'github/copilot.vim'
# setup copilot with :Copilot setup

# UI and file tree
Plug 'preservim/nerdtree'
Plug 'itchyny/lightline.vim'

# Better searching & fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

# Git integration
Plug 'tpope/vim-fugitive'

# Syntax and editing helpers
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'

call plug#end()

# ----- Core settings -----
set nocompatible
syntax on
filetype plugin indent on
set number
set relativenumber
set mouse=a
set ignorecase
set smartcase
set expandtab
set shiftwidth=2
set tabstop=2
set clipboard=unnamedplus
set termguicolors

# ----- Key mappings -----
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-p> :Files<CR>
# Coc navigation
inoremap <slilent><expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <CR> pumvisible() ? coc#pum#confirm() : "\<CR>"
# Coc go to definition
nnoremap <C-]> <Plug>(coc-definition)

# Copilot integration
g:copilot_no_tab_map = v:true
imap <silent><script><expr> <A-S> copilot#Accept("\<Tab>")
imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
imap <silent><script><expr> <A-n> copilot#Next()
imap <silent><script><expr> <A-p> copilot#Previous()


# ----- Lightline theme -----
g:lightline = { 'colorscheme': 'wombat' }

# ----- Startup message -----
autocmd VimEnter * echom "Vim 9.0 ready ✔"

# -----------
#  Install servers once inside Vim
#  :CocInstall coc-clangd coc-pyright
#


