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

-- Load plugins.
require('lazy').setup {
  require 'plugins.fileexplorer', -- File manager plugin.
  require 'plugins.theme', -- Colorscheme plugin.
  require 'plugins.tabs', -- Buffer/tabs line plugin.
  require 'plugins.infoline', -- Buffer line information plugin
  require 'plugins.parser', -- Language parser plugin.
  require 'plugins.fuzzyfind', -- Fuzzy find plugin.
  require 'plugins.gitsigns', -- Git signs on the editor gutter plugin.
  require 'plugins.welcome', -- Displays recent files on welcome screen plugin.
  require 'plugins.indentlines', -- Displays vertical lines for indents plugin.
  require 'plugins.misc', -- Small misc plugins.
  require 'plugins.bufferfileexplorer', -- Use buffer as file explorer plugin.
  require 'plugins.lazygit', -- Lazy git plugin.
  require 'plugins.outline', -- Outline window plugin.
  require 'plugins.lsp', -- Language Server Providers plugin.
  require 'plugins.autocompletion', -- Autocompletion plugin.
  require 'plugins.autoformatting', -- Autoformatting plugin.
  require 'plugins.fastjump', -- Fast jump with labels plugin.
}
