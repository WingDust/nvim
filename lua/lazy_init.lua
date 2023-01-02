local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)




require("lazy").setup({
    --{{{ ui
-- color scheme
{ 'shaunsingh/nord.nvim',lazy=false,priority = 1000,
 config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme nord]])
    end,
},
-- transparent
{
        'xiyaowong/nvim-transparent',
        config = function()
            require "transparent".setup {
                enable = true, -- boolean: enable transparent
                extra_groups = { -- table/string: additional groups that should be cleared
                -- In particular, when you set it to 'all', that means all available groups

                -- example of akinsho/nvim-bufferline.lua
                "BufferLineTabClose",
                "BufferlineBufferSelected",
                "BufferLineFill",
                "BufferLineBackground",
                "BufferLineSeparator",
                "BufferLineIndicatorSelected",
            },
            exclude = {}, -- table: groups you don't want to clear
        }
    end
},
    --}}}
    --{{{ edit mode
    -- surround
{
      "kylechui/nvim-surround",
      run = function()
          require("nvim-surround").setup({
              -- Configuration here, or leave empty to use defaults
          })
      end
  },
 'andymass/vim-matchup',
 'Vonr/align.nvim',
{
      'numToStr/Comment.nvim',
      run = function()
          --print('Comment')
          require('Comment').setup()
      end
  },
    --}}}
    --{{{ navigation
    -- dep
    
{
      'nvim-telescope/telescope.nvim',
      --requires = { {'nvim-lua/plenary.nvim'} }
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
  },
-- file navigation
{
  'phaazon/hop.nvim',
  config = function()
    -- you can configure Hop the way you like here; see :h hop-config
    --require 'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    require 'hop'.setup { keys = 'qwertyuiopasdfghjklzxcvbnm' }
  end
},

    --}}}
    --{{{ command
'mrjones2014/legendary.nvim'
    --}}}

})
