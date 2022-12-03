# Download data
wget https://raw.githubusercontent.com/tidyverse/ggplot2/main/data-raw/diamonds.csv
# use find, entr, cat, and duckdb to print sql
find sql/q.sql | entr sh -c 'echo "calculating..." & cat sql/q.sql | duckdb main.duckdb'
# output as csv for tidy-viewer
find sql/q.sql | entr sh -c 'echo "calculating..." & cat sql/q.sql | duckdb --csv main.duckdb'
# pipe to tidy-viewer
find sql/q.sql | entr sh -c 'echo "calculating..." & cat sql/q.sql | duckdb --csv main.duckdb | tidy-viewer'
# clear screen on each file save
find sql/q.sql | entr sh -c 'clear & echo "calculating..." & cat sql/q.sql | duckdb --csv main.duckdb | tidy-viewer'
# remove unnecesary parts. 
find sql/q.sql | entr sh -c 'clear & cat sql/q.sql | duckdb --csv main.duckdb | tidy-viewer'


# Install nvim
Debian Package
1. Download nvim-linux64.deb from [releases](https://github.com/neovim/neovim/releases)
2. Install the package using `sudo dpkg -i --force-overwrite ./nvim-linux64.deb`
3. Run nvim

# Verify init.lua is working
1. Make directory: mkdir ~/.config/nvim
2. Make init file: nvim ~/.config/nvim/init.lua
3. Test with `print(math.pi)` (insert mode) and `:luafile %` or `:so %` (normal mode)
At this point the nvim 0.8.* should be installed and should be able to evaluate the init.lua file

# Install Packer to install plugins
1. Download Packer: `git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim`
2. Install Packer [Boostrapping](https://github.com/wbthomason/packer.nvim#bootstrapping)
 - Put Boostrapping code in `init.lua`
 - Run `:luafile %` to source the file
 - The packer commands should now be available in normal mode `:PackerInstall`

# Set Colortheme -- Also Install First Package
1. Add [Everforest Theme](https://github.com/sainnhe/everforest): `use sainnhe/everforest`
2. `:luafile %`
3. `:PackerInstall`

# Learn how to use packages
1. Look at help `:help everforest`
2. Convert vim syntax to nvim-lua syntax guide

|vim                                       | init.lua                                            |
|==========================================|=====================================================|
`set termguicolors`                        |`vim.o.termguicolors = true`
`colorscheme everforest`                   |`vim.cmd[[colorscheme everforest]]`                  |
`set background=dark`                      |`vim.o.background = "dark"`                          |
`g:everforest_background = 'soft'`         |`vim.g.everforest_background = "soft"`               |
`let g:everforest_better_performance = 1`  |`vim.g.everforest_better_performance = 1`            |

To learn more look here https://github.com/nanotee/nvim-lua-guide
