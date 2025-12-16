-- custom/plugins/init.lua
return {
  {
    'mikavilpas/yazi.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
      {
        '<leader>z',
        function()
          require('yazi').yazi()
        end,
        mode = 'n',
        desc = 'Launch Yazi File Manager (Floating: <leader>z)',
      },
    },
    opts = {},
    config = function()
      require('yazi').setup {}
    end,
  },
}
