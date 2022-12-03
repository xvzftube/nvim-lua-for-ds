vim.o.termguicolors = true
vim.cmd[[colorscheme everforest]]
vim.o.background = "dark"
vim.g.everforest_background = "soft"
vim.g.everforest_better_performance = 1
--vim.g.coc_node_path='/home/user/.nvm/versions/node/v19.2.0/bin/node'
--vim.g.coc_npm_path='/home/user/.nvm/versions/node/v19.2.0/bin/npm'

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'sainnhe/everforest'
  use {'neoclide/coc.nvim', branch = 'release'}
  use { 'quarto-dev/quarto-nvim',
  requires = {'neovim/nvim-lspconfig'}
}

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

