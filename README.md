## List to things to watch out for me in the future

- There are some places with hard-coded directory for '~/.config/nvim'
- Haven't done clean install of this configuration, I could mess up plugin orders

### Packer

```sh
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

### nvim-pack/nvim-spectre (Find and replace plugin)

#### Install gnu-sed to work properly (MacOS only)

Sometimes may not show all the results just search via telescope once then will
results will be shown

```sh
brew install gnu-sed
```
