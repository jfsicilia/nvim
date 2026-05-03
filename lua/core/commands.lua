local maximized = false

local function toggle_pane_max()
  if maximized then
    vim.cmd 'wincmd ='
  else
    vim.cmd 'wincmd |'
    vim.cmd 'wincmd _'
  end
  maximized = not maximized
end

vim.api.nvim_create_user_command('PaneMaxToggle', function()
  toggle_pane_max()
end, {})
