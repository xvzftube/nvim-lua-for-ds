# NVIM For Data Science

The purpose of this tutorial is to make a neovim-lua configuration that works for data scientists. There are two features that I am going for

1. Be relentlessly minimal: Minimalism is less likely to be break in the future and is easier to maintain. Some people make vim/neovim their IDE. While I think this is possible my motto is "vim is a text editor and Linux OS is the IDE". The editor should be just enough to get a lot of work done.
2. Be aesthetic
3. Be functional
4. Use packages that greatly enhance the vim experience

## What makes this "For Data Science"

### Support for DS languages via Syntax Highlighting and Completion

Data scientists mainly use one to all of the following: Python, R, SQL

### Interactive programming

An NVIM config for data science should have syntax highlighting for these languages at a minimum.
Interactive coding. In standard coding practice we see the following flow

1. Code
2. Run complete file
3. Repeat

This flow is time consuming in a Data Science workflow for two reasons a) loading data slows the script b) training models slow script. For these reasons it is nice to not have to rerun the full script, but to run just parts of a script. There are many options for interactive development. Jupyter notebooks are the most used. I don't care for notebooks so I use other tools to code interactively.

### Multiview

Multiview = code + artifacts. An artifact can be a webpage, plot, table of data, etc.

The code is just a means to an end. Like web developers Data Scientists look at output of code about as much as the code itself, if not more. The difference between data scientists and front end web dev is that we do not look at websites, but tables of data and plots. A data scientist's text editing experience is enhanced when multiview (code + artifacts) is supported.

## Some Extras I like to have

status bar
vim gutter
easymotions
comfortable motions
buffer word completion
path completion
linting
python library sorting
spelling correction
side bar navigation


1. Better naviation comfotable motion
2. 

## What is not included



## Part 1

### Install Neovim
Debian Package
1. Download nvim-linux64.deb from [releases](https://github.com/neovim/neovim/releases)
2. Install the package using `sudo dpkg -i --force-overwrite ./nvim-linux64.deb`
3. Run nvim

### Verify init.lua is working
1. Make directory: mkdir ~/.config/nvim
2. Make init file: nvim ~/.config/nvim/init.lua
3. Test with `print(math.pi)` (insert mode) and `:luafile %` or `:so %` (normal mode)
At this point the nvim 0.8.* should be installed and should be able to evaluate the init.lua file

### Install Packer to install plugins
1. Download Packer: `git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim`
2. Install Packer [Boostrapping](https://github.com/wbthomason/packer.nvim#bootstrapping)
 - Put Boostrapping code in `init.lua`
 - Run `:luafile %` to source the file
 - The packer commands should now be available in normal mode `:PackerInstall`

### Set Colortheme -- Also Install First Package
1. Add [Everforest Theme](https://github.com/sainnhe/everforest): `use sainnhe/everforest`
2. `:luafile %`
3. `:PackerInstall`

### Learn how to use packages
1. Look at help `:help everforest`
2. Convert vim syntax to nvim-lua syntax guide

| vim                                       | init.lua                                  |
| ----------------------------------------- | ----------------------------------------- |
| `set termguicolors`                       | `vim.o.termguicolors = true`              |
| `colorscheme everforest`                  | `vim.cmd[[colorscheme everforest]]`       |
| `set background=dark`                     | `vim.o.background = "dark"`               |
| `g:everforest_background = 'soft'`        | `vim.g.everforest_background = "soft"`    |
| `let g:everforest_better_performance = 1` | `vim.g.everforest_better_performance = 1` |

To learn more look here https://github.com/nanotee/nvim-lua-guide

## Part 2

For code completion I will use coc. This package uses nodejs under the hood.

Read the readme here https://github.com/neoclide/coc.nvim or follow the instructions below

Also read 
https://github.com/neoclide/coc.nvim/wiki/Install-coc.nvim

### Install node
1. Download: https://nodejs.org/en/download/current/  
2. Untar: `tar -xf node-v19.2.0-linux-x64.tar.xz` (make sure your version number of node is matching!)
3. Copy the binary to /usr/local/bin/: `sudo cp node-v19.2.0-linux-x64/bin/node /usr/local/bin/`
4. Test that node is installed: `node`

### Install nvm
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash

source ~/.bashrc
command -v nvm
node -v
npm -v

### Install npm
1. `sudo apt install npm`

### Install and Configure COC


1. Add package to packer `use `
2. Test `:CocInstall coc-json`

:CocConfig

{
    "npm.binPath": "~/.nvm/versions/node/v19.2.0/bin/npm",
}



### Install Python

### Install SQL
`npm i -g sql-language-server`

:CocConfig
```
    "languageserver": {
  "sql": {
    "module": "/home/user/.nvm/versions/node/v19.2.0/bin/sql-language-server",
    "args": ["up", "--method", "node-ipc"],
    "filetypes": ["sql", "mysql"]
  }
}

```

### Install R

In R
`install.packages("languageserver")`
:CocInstall coc-r-lisp

https://github.com/REditorSupport/languageserver
install.packages("rmarkdown")

### tags:
how to install packer, how to install nvim, getting started with nvim, install lua nvim, nvim lua, nvim, nvim for data science,
