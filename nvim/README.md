# Installation

## Packer

```sh
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

## Nerd fonts (Jetbrains Mono)

```sh
brew tap homebrew/cask-fonts &&
brew install --cask font-jetbrains-mono-nerd-font
```

## gnu-sed for nvim-pack/nvim-spectre (Find and replace plugin) MacOS

```sh
brew install gnu-sed
```

### List to things to watch out for me in the future

- There are some places with hard-coded directory for '~/.config/nvim'
- Haven't done clean install of this configuration, I could mess up plugin orders
