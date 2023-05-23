## Installation

For MacOS.

```
ln .vimrc ~/.vimrc
ln .zshrc ~/.zshrc
ln .config/nvim ~/.config/nvim
ln .config/pgcli ~/.config/pgcli

# Developer tools, also available for install via running "git init" for the first time
xcode-select --install

# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Python Stuff
brew install pyenv python
pyenv install <version>  # Get versions from pyenv install --list
pyenv global <version>
curl -sSL https://install.python-poetry.org | python -

# Editor
brew install neovim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

## Inside Vim
## :PlugInstall

# Tooling

## CLI
brew install fzf ripgrep jq gh

## Databases
brew install pgcli
```

### Terminal Themes
Text: `#feec7c`
Background: `#1e0708`
