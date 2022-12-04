vim.o.termguicolors = true
vim.cmd[[colorscheme everforest]]
vim.o.background = "dark"
vim.g.everforest_background = "soft"
vim.g.everforest_better_performance = 1

vim.o.spelllang="en_us"
vim.o.spellfile="~/.config/nvim/en.utf-8.add"

-- vim-isort 
vim.g.vim_isort_map = '<C-i>'
-- General
vim.o.number=true                           --set line numbers
vim.api.nvim_command("set noswapfile")      -- no swap
vim.o.clipboard="unnamedplus"               --Copy/paste between vim and other programs. '"+y' then middlemouse
vim.o.expandtab=true                        --Use spaces instead of tabs.
vim.o.smarttab=true                         --Uses shiftwidth and tabstap to insert blanks when <Tab>
vim.o.shiftwidth=2                          --One tab == four spaces.
vim.o.tabstop=2                             --One tab == four spaces.<Paste>

--" remap
--:imap ii <Esc>
--" python alias (,p runs python on script. ,t times python script)
--nmap ,p :w<CR>:!python3 %<CR>
--nmap ,t :w<CR>:!time python3 %<CR>

--vim.g.coc_node_path='/home/user/.nvm/versions/node/v19.2.0/bin/node'
--vim.g.coc_npm_path='/home/user/.nvm/versions/node/v19.2.0/bin/npm'
--
--iron
local iron = require("iron.core")
local view = require("iron.view")

iron.setup {
  config = {
    -- Whether a repl should be discarded or not
    scratch_repl = true,
    -- Your repl definitions come here
    repl_definition = {
      sh = {
        -- Can be a table or a function that
        -- returns a table (see below)
        command = {"bash"}
      }
    },
    -- How the repl window will be displayed
    -- See below for more information
    repl_open_cmd = require('iron.view').bottom(40),
  },
  -- Iron doesn't set keymaps by default anymore.
  -- You can set them here or manually add keymaps to the functions in iron.core
  keymaps = {
    send_motion = "<space>sc",
    visual_send = "<space>sc",
    send_file = "<space>sf",
    send_line = "<space>sl",
    send_mark = "<space>sm",
    mark_motion = "<space>mc",
    mark_visual = "<space>mc",
    remove_mark = "<space>md",
    cr = "<space>s<cr>",
    interrupt = "<space>s<space>",
    exit = "<space>sq",
    clear = "<space>cl",
  },
  -- If the highlight is on, you can change how it looks
  -- For the available options, check nvim_set_hl
  highlight = {
    italic = true
  },
  ignore_blank_lines = true, -- ignore blank lines when sending visual select lines
  repl_open_cmd = view.top("10%")
}
-- iron also has a list of commands, see :h iron-commands for all available commands
vim.keymap.set('n', '<space>rs', '<cmd>IronRepl<cr>')
vim.keymap.set('n', '<space>rr', '<cmd>IronRestart<cr>')
vim.keymap.set('n', '<space>rf', '<cmd>IronFocus<cr>')
vim.keymap.set('n', '<space>rh', '<cmd>IronHide<cr>')
-------------------iron
--
--lualine
require('lualine').setup {
  options = {
    icons_enabled = false,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    separator = nil,
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
  --+-------------------------------------------------+
  --| A | B | C                             X | Y | Z |
  --+-------------------------------------------------+
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = { "os.date('%F | %H:%M:%S')",'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
}
-- end lualine
--
-- neoscroll
require('neoscroll').setup({
    -- All these keys will be mapped to their corresponding default scrolling animation
    mappings = {'<C-u>', '<C-d>', '<C-b>', '<C-f>',
                '<C-y>', '<C-e>', 'zt', 'zz', 'zb'},
    hide_cursor = true,          -- Hide cursor while scrolling
    stop_eof = true,             -- Stop at <EOF> when scrolling downwards
    respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
    cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
    easing_function = nil,       -- Default easing function
    pre_hook = nil,              -- Function to run before the scrolling animation starts
    post_hook = nil,             -- Function to run after the scrolling animation ends
    performance_mode = false,    -- Disable "Performance Mode" on all buffers.
})
-- end neoscrool
-- gitsigns
require('gitsigns').setup()
-- end gitsigns
-- hop
-- https://github.com/phaazon/hop.nvim/wiki/Commands
local hop = require('hop')
local directions = require('hop.hint').HintDirection
vim.keymap.set('', 'f', function()
  hop.hint_words({ direction = directions.AFTER_CURSOR, current_line_only = false})
end, {remap=true})
vim.keymap.set('', 'F', function()
  hop.hint_words({ direction = directions.BEFORE_CURSOR, current_line_only = false})
end, {remap=true})
vim.keymap.set('', 'L', function()
  hop.hint_lines({ current_line_only = false})
end, {remap=true})
require('hop').setup(
{
  hint_position = require'hop.hint'.HintPosition.MIDDLE,
})
-- hop
--
-- nvim tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.keymap.set('n','nf', ":NvimTreeFocus<CR>")
vim.keymap.set('n','nn', ":NvimTreeToggle<CR>")
require("nvim-tree").setup()
-- end ncim tree

vim.keymap.set('n', '<space>rs', '<cmd>IronRepl<cr>')
vim.keymap.set('n', '<space>rr', '<cmd>IronRestart<cr>')
vim.keymap.set('n', '<space>rf', '<cmd>IronFocus<cr>')
vim.keymap.set('n', '<space>rh', '<cmd>IronHide<cr>')

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
  use { 'quarto-dev/quarto-nvim',requires = {'neovim/nvim-lspconfig'}}
  use {'hkupty/iron.nvim'}
  use {'nvim-lualine/lualine.nvim',requires = { 'kyazdani42/nvim-web-devicons', opt = true }}
  use 'karb94/neoscroll.nvim'
  use {'lewis6991/gitsigns.nvim'}
  use {
  'phaazon/hop.nvim',
  branch = 'v2', -- optional but strongly recommended
  config = function()
    -- you can configure Hop the way you like here; see :h hop-config
    require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
  end
}
  use {
  'nvim-tree/nvim-tree.lua',
  requires = {
    'nvim-tree/nvim-web-devicons', -- optional, for file icons
  },
  tag = 'nightly' -- optional, updated every week. (see issue #1193)
}


  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

