local M= {
---- color scheme
    {'shaunsingh/nord.nvim',
 lazy=false,
 priority = 1000,
 config = function()
      -- load the colorscheme here
      --
      vim.cmd([[colorscheme nord]])

      -- [tynvim](https://github.com/tynguyen2k1/tynvim)
      vim.g.nord_contrast = true
      vim.g.nord_borders = true
      vim.g.nord_disable_background = false
      vim.g.nord_italic = false
      vim.cmd([[
      highlight Normal ctermbg=none
      highlight NonText ctermbg=none

      highlight Normal guibg=none
      highlight NonText guibg=none
      ]])
 end,
 },
}

-- M.nord = require('nord')

return M
