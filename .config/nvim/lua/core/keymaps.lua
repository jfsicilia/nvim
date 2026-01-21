-- Keymaps for better default experience

-- Set leader key
vim.g.mapleader = ','
vim.g.maplocalleader = ','

-- For conciseness
local opts = { noremap = true, silent = true }

-- Disable the leader key's default behavior in Normal and Visual modes
vim.keymap.set({ 'n', 'v' }, ',', '<Nop>', { silent = true })

-- Allow moving the cursor through wrapped lines with j, k
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Clear highlights
vim.keymap.set('n', '<Esc>', ':noh<CR>', opts)

-- Save file
vim.keymap.set('n', '<C-s>', '<cmd>w<CR>', opts)
vim.keymap.set('i', '<C-s>', '<C-o>:w<CR>', opts)
-- Save file without auto-formatting
vim.keymap.set('n', '<leader>sn', '<cmd>noautocmd w <CR>', opts)

-- Quit file
vim.keymap.set('n', '<C-q>', '<cmd> q <CR>', opts)

-- c or x does not copy. Use yank to copy.
-- vim.keymap.set('n', 'd', '"_d', opts)
vim.keymap.set('n', 'c', '"_c', opts)
vim.keymap.set('n', 'x', '"_x', opts)

-- Arrow like movement in insert and normal mode.
vim.keymap.set({ 'n', 'i' }, '<C-h>', '<Left>', opts)
vim.keymap.set({ 'n', 'i' }, '<C-l>', '<Right>', opts)
vim.keymap.set({ 'n', 'i' }, '<C-j>', '<Down>', opts)
vim.keymap.set({ 'n', 'i' }, '<C-k>', '<Up>', opts)

-- Select all
vim.keymap.set('n', '<leader>a', 'ggVG', opts)

-- Move lines
vim.keymap.set('n', '-', ':m .+1<CR>', opts) -- move line upwards(n)
vim.keymap.set('n', '_', ':m .-2<CR>', opts) -- move line downwards(n)
vim.keymap.set('v', '-', ":m '>+1<CR>gv=gv") -- move line upwards(v)
vim.keymap.set('v', '_', ":m '<-2<CR>gv=gv") -- move line downwards(v)

-- Vertical scroll and center
vim.keymap.set('n', '<C-d>', '<C-d>zz', opts)
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts)

-- Find and center
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Resize with arrows
vim.keymap.set('n', '<Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<Right>', ':vertical resize +2<CR>', opts)

-- Buffers
vim.keymap.set('n', '<Tab>', ':bnext<CR>', opts)
vim.keymap.set('n', '<leader>.', ':bnext<CR>', opts)
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', opts)
vim.keymap.set('n', '<leader>m', ':bprevious<CR>', opts)
vim.keymap.set('n', '<leader><leader>', ':b#<CR>', opts)
vim.keymap.set('n', '<C-i>', '<C-i>', opts) -- to restore jump forward
vim.keymap.set('n', '<leader>x', ':Bdelete!<CR>', opts) -- close buffer
vim.keymap.set('n', '<leader>b', '<cmd> enew <CR>', opts) -- new buffer

-- Increment/decrement numbers
vim.keymap.set('n', '<leader>+', '<C-a>', opts) -- increment
vim.keymap.set('n', '<leader>-', '<C-x>', opts) -- decrement

-- Window management
-- vim.keymap.set('n', '<leader>v', '<C-w>v', opts) -- split window vertically
-- vim.keymap.set('n', '<leader>h', '<C-w>s', opts) -- split window horizontally
vim.keymap.set('n', '<leader>se', '<C-w>=', opts) -- make split windows equal width & height
vim.keymap.set('n', '<leader>xs', ':close<CR>', opts) -- close current split window

-- Navigate between splits
vim.keymap.set('n', '<leader>k', ':wincmd k<CR>', opts)
vim.keymap.set('n', '<leader>j', ':wincmd j<CR>', opts)
vim.keymap.set('n', '<leader>h', ':wincmd h<CR>', opts)
vim.keymap.set('n', '<leader>l', ':wincmd l<CR>', opts)

-- Blank lines
vim.keymap.set('n', '<leader>-', ":<C-u>call append(line('.'), repeat([''], v:count1))<CR>", opts)
vim.keymap.set('n', '<leader>_', ":<C-u>call append(line('.')-1, repeat([''], v:count1))<CR>", opts)

-- Fast line begin/end
vim.keymap.set('n', 'H', '^', opts)
vim.keymap.set('n', 'L', '$', opts)

-- Tabs
vim.keymap.set('n', '<leader>to', ':tabnew<CR>', opts) -- open new tab
vim.keymap.set('n', '<leader>tx', ':tabclose<CR>', opts) -- close current tab
vim.keymap.set('n', '<leader>tn', ':tabn<CR>', opts) --  go to next tab
vim.keymap.set('n', '<leader>tp', ':tabp<CR>', opts) --  go to previous tab

-- Toggle line wrapping
--vim.keymap.set('n', '<leader>lw', '<cmd>set wrap!<CR>', opts)

-- Press jk fast to exit insert mode
--vim.keymap.set('i', 'jk', '<ESC>', opts)
--vim.keymap.set('i', 'kj', '<ESC>', opts)

-- Stay in indent mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

-- Move text up and down
vim.keymap.set('v', '<A-j>', ':m .+1<CR>==', opts)
vim.keymap.set('v', '<A-k>', ':m .-2<CR>==', opts)

-- Keep last yanked when pasting
vim.keymap.set('v', 'p', '"_dP', opts)

-- Replace word under cursor
vim.keymap.set('n', '<leader>j', '*``cgn', opts)

-- Explicitly yank to system clipboard (highlighted and entire row)
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]])
vim.keymap.set('n', '<leader>Y', [["+Y]])

-- Toggle diagnostics
local diagnostics_active = true

vim.keymap.set('n', '<leader>do', function()
  diagnostics_active = not diagnostics_active

  if diagnostics_active then
    vim.diagnostic.enable(true)
  else
    vim.diagnostic.enable(false)
  end
end)

-- Diagnostic keymaps
vim.keymap.set('n', '[d', function()
  vim.diagnostic.jump { count = -1, float = true }
end, { desc = 'Go to previous diagnostic message' })

vim.keymap.set('n', ']d', function()
  vim.diagnostic.jump { count = 1, float = true }
end, { desc = 'Go to next diagnostic message' })

vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Save and load session
vim.keymap.set('n', '<leader>ss', ':mksession! .session.vim<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>sl', ':source .session.vim<CR>', { noremap = true, silent = false })
