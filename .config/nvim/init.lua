require 'core.options'
require 'core.keymaps'

-- Load lazy.nvim plugin manager.
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
---@diagnostic disable-next-line: undefined-field
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end

local rtp = vim.opt.rtp
rtp:prepend(lazypath)

-- Configure lazy.nvim.
require('lazy').setup {
  require 'plugins.fileexplorer', -- Neotree file manager plugin.
  require 'plugins.theme', -- Catppuccin colorscheme plugin.
  require 'plugins.tabs', -- Buffer/tabs line plugin.
  require 'plugins.infoline', -- Current buffer line information.
  require 'plugins.parser', -- Parses language to tree for better code comprehension.
  require 'plugins.fuzzyfind', -- Fuzzy find in neovim.
  require 'plugins.gitsigns', -- Git signs on the editor gutter.
  require 'plugins.welcome', -- Displays recent files on welcome screen.
  require 'plugins.indentlines', -- Displays vertical lines for different idents.
  require 'plugins.misc', -- Misc plugins
  require 'plugins.bufferfileexplorer', -- Use buffer as file explorer.
  require 'plugins.lazygit', -- Use lazy git in vim.
  require 'plugins.outline', -- Get an outline window.
  require 'plugins.lsp', -- Language Server Providers.
  require 'plugins.autocompletion', -- Autocompletion.
  require 'plugins.autoformatting', -- Autoformatting.
  require 'plugins.fastjump', -- Autoformatting.
}
