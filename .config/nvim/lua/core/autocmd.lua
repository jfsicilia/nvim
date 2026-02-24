local core_autocmd = vim.api.nvim_create_augroup('core_autocmd', { clear = true })
--
-- Activates commonlisp language syntax when opening .kbd files.
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = '*.kbd',
  group = core_autocmd,
  callback = function()
    vim.bo.filetype = 'commonlisp'
  end,
})

-- Highlight yank.
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when copying (yank)',
  group = core_autocmd,
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Saves sessions help function.
local function save_session()
  -- Avoids saving tmp files or empty buffers.
  if vim.fn.empty(vim.fn.expand '%:p') == 0 then
    vim.cmd 'mksession! .session.vim'
  end
end

-- Saves session when writing buffer.
vim.api.nvim_create_autocmd('BufWritePost', {
  desc = 'Saves session when writing buffer',
  group = core_autocmd,
  callback = save_session,
})

-- Saves session when leaving vim.
vim.api.nvim_create_autocmd('VimLeave', {
  desc = 'Saves session when leaving vim',
  group = core_autocmd,
  callback = function()
    vim.cmd 'Neotree close' -- Avoids saving neotree buffer.
    save_session()
  end,
})
