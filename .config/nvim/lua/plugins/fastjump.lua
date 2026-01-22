return {
  'folke/flash.nvim',
  event = 'VeryLazy',
  opts = {
    label = {
      -- Don't user uppercase letters in labels.
      uppercase = false,
      -- Use colors in labels.
      rainbow = {
        enabled = true,
        shades = 9,
      },
    },
    modes = {
      -- Enable fast jump in searches.
      search = {
        enabled = true,
      },
      -- Enable labels in f, F, t, T
      char = {
        jump_labels = false,
      },
    },
  },
  keys = {
    {
      '<space>',
      mode = { 'n', 'x', 'o' },
      function()
        require('flash').jump()
      end,
      desc = 'Flash',
    },
    {
      '<S-space>',
      mode = { 'n', 'x', 'o' },
      function()
        require('flash').treesitter()
      end,
      desc = 'Flash Treesitter',
    },
    -- {
    --   'r',
    --   mode = 'o',
    --   function()
    --     require('flash').remote()
    --   end,
    --   desc = 'Remote Flash',
    -- },
    -- {
    --   'R',
    --   mode = { 'o', 'x' },
    --   function()
    --     require('flash').treesitter_search()
    --   end,
    --   desc = 'Treesitter Search',
    -- },
    -- {
    --   '<c-s>',
    --   mode = { 'c' },
    --   function()
    --     require('flash').toggle()
    --   end,
    --   desc = 'Toggle Flash Search',
    -- },
  },
}
