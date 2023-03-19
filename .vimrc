" set the runtime path to include plug and initialize
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin()

Plug 'preservim/nerdtree'
Plug 'junegunn/fzf.vim'  " brew install fzf ripgrep
Plug 'junegunn/fzf'
Plug 'yuki-yano/fzf-preview.vim', { 'branch': 'release/rpc' }

" All of your Plugs must be added before the following line
call plug#end()            " required

" General config
" push more characters through to the terminal per cycle
set ttyfast
" don't update the screen during commands
set lazyredraw
set nu
set nowrap
set backspace=indent,eol,start
set foldmethod=indent
set foldlevel=99
set autoread
set autoindent
set splitbelow
set splitright
set spell spelllang=en_us
hi clear SpellBad
hi SpellBad cterm=underline
" Show matching brackets
set showmatch
" Matching settings
set ignorecase
set smartcase
set incsearch

" Use the system keyboard
set clipboard=unnamed

" fzf
set rtp+=~/.fzf
nnoremap <Leader>ff :Files<cr>
nnoremap <Leader>f :Rg<cr>
nnoremap <C-\> <C-^>

" Reopen at last closed line
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Key mappings
let mapleader=";"

" Useful binds
inoremap <Leader>pd <C-R>=strftime('%m/%d/%y %H:%M:%S')<CR>

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
nnoremap <Leader>n :bnext<CR>
nnoremap <Leader>c :bnext <bar> :bd #<CR>
nnoremap <Leader>vr :source $MYVIMRC<CR>
nnoremap <Leader>vm :vsp $MYVIMRC<CR>
nnoremap <Leader>vn :NERDTreeToggle ~/notesd <bar> :cd ~/notesd<CR>
nnoremap <Leader>ft :NERDTreeToggle<CR>

" Generate helptags, must be set at end
silent! helptags ALL
set secure

