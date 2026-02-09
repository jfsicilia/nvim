-- Adds git related signs to the gutter, as well as utilities for managing changes
return {
  'lewis6991/gitsigns.nvim',
  opts = {
    -- See `:help gitsigns.txt`
    signs = {
      add = { text = '+' },
      change = { text = '~' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
    },
    -- TODO: Show count lines in gutter.
    -- count_chars = {
    --   [1] = '', -- Si es 1 línea, no muestra número
    --   [2] = '₂', -- Subíndices para que quepan en el gutter
    --   [3] = '₃',
    --   [4] = '₄',
    --   [5] = '₅',
    --   [6] = '₆',
    --   [7] = '₇',
    --   [8] = '₈',
    --   [9] = '₉',
    --   ['+'] = '₊', -- Para más de 9 líneas
    -- },
    signs_staged = {
      add = { text = '+' },
      change = { text = '~' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
    },
    on_attach = function(bufnr)
      local gitsigns = require 'gitsigns'
      local opts = { buffer = bufnr }

      local function map(mode, l, r, desc)
        vim.keymap.set(mode, l, r, vim.tbl_extend('force', opts, { desc = 'GitS: ' .. desc }))
      end

      -- Navigation
      map('n', ']c', function()
        if vim.wo.diff then
          vim.cmd.normal { ']c', bang = true }
        else
          gitsigns.nav_hunk 'next'
        end
      end, 'Next hunk')

      map('n', '[c', function()
        if vim.wo.diff then
          vim.cmd.normal { '[c', bang = true }
        else
          gitsigns.nav_hunk 'prev'
        end
      end, 'Previous hunk')

      -- Actions
      map('n', '<leader>ghs', gitsigns.stage_hunk, 'Stage hunk')
      map('n', '<leader>ghr', gitsigns.reset_hunk, 'Reset hunk')

      map('v', '<leader>ghs', function()
        gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
      end, 'Stage hunk')

      map('v', '<leader>ghr', function()
        gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
      end, 'Reset hunk')

      map('n', '<leader>ghS', gitsigns.stage_buffer, 'Stage buffer')
      map('n', '<leader>ghR', gitsigns.reset_buffer, 'Reset buffer')
      map('n', '<leader>ghp', gitsigns.preview_hunk, 'Preview hunk')
      map('n', '<leader>ghi', gitsigns.preview_hunk_inline, 'Preview hunk inline')

      map('n', '<leader>ghb', function()
        gitsigns.blame_line { full = true }
      end, 'Blame inline')

      map('n', '<leader>ghd', gitsigns.diffthis, 'Diff this')

      map('n', '<leader>ghD', function()
        gitsigns.diffthis '~'
      end, 'Diff this')

      map('n', '<leader>ghQ', function()
        gitsigns.setqflist 'all'
      end, 'Set quickfix list all')
      map('n', '<leader>ghq', gitsigns.setqflist, 'Set quickfix list')

      -- Toggles
      map('n', '<leader>tb', gitsigns.toggle_current_line_blame, 'Toggle line blame')
      map('n', '<leader>tw', gitsigns.toggle_word_diff, 'Toggle word diff')

      -- Text object
      map({ 'o', 'x' }, 'ih', gitsigns.select_hunk, 'Select hunk (text object)')
    end,
  },
}
