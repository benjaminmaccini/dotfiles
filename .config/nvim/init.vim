" Source the base vimrc
set runtimepath^=~/.vim runtimepath+=~/.vim/after runtimepath+=~/.config/nvim
let &packpath = &runtimepath
source ~/.vimrc

" Also use the nvim stuff
lua require("init")
