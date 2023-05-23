" This is a basic vimrc for simple editing. Anything more complicated should
" be done via nvim

" set the runtime path to include plug and initialize
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin()

Plug 'junegunn/fzf.vim'  " brew install fzf ripgrep
Plug 'junegunn/fzf'

" All of your Plugs must be added before the following line
call plug#end()            " required

" Key mappings
let mapleader=";"

" Access to the system keyboard
map <leader>y "+y
map <leader>p "+p

" sometimes I get off the shift key too slowly
command W w
command Q q
command Wq wq
command WQ wq

" Window nav
nnoremap <Leader>j <C-W><C-J>
nnoremap <Leader>k <C-W><C-K>
nnoremap <Leader>l <C-W><C-L>
nnoremap <Leader>h <C-W><C-H>
nnoremap <silent> <Leader>d :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
nnoremap <silent> <Leader>a :exe "vertical resize " . (winwidth(0) * 2/3)<CR>
nnoremap <silent> <Leader>s :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>w :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <Leader>n :bnext<CR>
nnoremap <Leader>c :bnext <bar> :bd #<CR>

" fzf
set rtp+=~/.fzf
nnoremap <C-\> <C-^>

" General config
syntax on
filetype on

set ttyfast			 " push more characters through to the terminal per cycle
set lazyredraw                   " don't update the screen during commands
set nu
set nowrap
set backspace=indent,eol,start
set foldmethod=indent
set foldlevel=99
set autoread    		 " Auto update read-only files
set autoindent
set splitbelow
set splitright

" Customize session options. Namely, I don't want to save hidden and
" unloaded buffers or empty windows.
set sessionoptions="curdir,folds,help,options,tabpages,winsize"

" Backup settings
execute "set directory=" . "~/vim.bak/" . "/swap"
execute "set backupdir=" . "~/vim.bak/" . "/backup"
execute "set undodir=" . "~/vim.bak/" . "/undo"
set backup
set undofile
set writebackup

" Show matching brackets
set showmatch

" Matching settings
set hlsearch
set ignorecase
set incsearch
set smartcase

" Tab completion settings
set wildmode=list:longest     " Wildcard matches show a list, matching the longest first
set wildignore+=.git,.hg,.svn " Ignore version control repos
set wildignore+=*.6           " Ignore Go compiled files
set wildignore+=*.pyc         " Ignore Python compiled files
set wildignore+=*.swp         " Ignore vim backups


" Reopen at last closed line
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" Make configs accessible
if has('nvim')
	nnoremap <Leader>nvm :vsp ~/.config/nvim/lua/init.lua<CR>
endif

nnoremap <Leader>vm :vsp ~/.vimrc<CR>

" Generate helptags, must be set at end
silent! helptags ALL
set secure
