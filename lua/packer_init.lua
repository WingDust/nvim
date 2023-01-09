
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'


if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path
  })
  vim.o.runtimepath = vim.fn.stdpath('data') .. '/site/pack/*/start/*,' .. vim.o.runtimepath
end

-- Autocommand that reloads neovim whenever you save the packer_init.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer_init.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  return
end


return packer.startup(function(use)

  -- Add you plugins here:
  use 'wbthomason/packer.nvim' -- packer can manage itself
  -- edit mode
  use({
      "kylechui/nvim-surround",
      tag = "*", -- Use for stability; omit to use `main` branch for the latest features
      run = function()
          require("nvim-surround").setup({
              -- Configuration here, or leave empty to use defaults
          })
      end
  })
  -- use { 
  --     'nguyenvukhang/nvim-toggler',
  --     config = function() 
  --         require('nvim-toggler').setup()
  --     end
  -- }
  use {
      'numToStr/Comment.nvim',
      loaded = true,
      run = function()
          print('Comment')
          require('Comment').setup()
      end
  }
  use 'Vonr/align.nvim'

  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }
  use { 
      'windwp/nvim-autopairs',
      run = function() require('nvim-autopairs').setup({ }) 
  end,
  }
  use { 
      'windwp/nvim-ts-autotag',
      run = function() require('nvim-ts-autotag').setup({ 
          filetypes = { "html" , "xml" , "vue" , "js" ,"jsx" },
      }) 
  end,
  }
  use { 'smithbm2316/centerpad.nvim' }
  use 'andymass/vim-matchup'

  use 'nvim-lua/plenary.nvim'
  -- :checkhealth telescope
  use {
      'nvim-telescope/telescope.nvim',
      requires = { {'nvim-lua/plenary.nvim'} }
  }
  use { "kkharji/sqlite.lua" }
  use {
      "nvim-telescope/telescope-frecency.nvim",
      run = function()
          require"telescope".load_extension("frecency")
      end,
      requires = {"kkharji/sqlite.lua"}
  }
  -- 像编辑buffer 一样编辑文件目录
  use "elihunter173/dirbuf.nvim"

  use {'nvim-tree/nvim-web-devicons'}
  -- 文本替换
  use {'nvim-pack/nvim-spectre'}
  use {'stevearc/dressing.nvim'}

  use({'mrjones2014/legendary.nvim'})

  -- 没有 dir 自动创建
  use 'jghauser/mkdir.nvim'

  use {
  'phaazon/hop.nvim',
  branch = 'v2', -- optional but strongly recommended
  config = function()
    -- you can configure Hop the way you like here; see :h hop-config
    -- require 'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    require 'hop'.setup { keys = 'qwertyuiopasdfghjklzxcvbnm' }
  end
    }
-- color scheme
	use {'shaunsingh/nord.nvim',
    -- https://github.com/shaunsingh/nord.nvim/issues/113
    commit = "78f5f001709b5b321a35dcdc44549ef93185e024",
    config = function()
		--Lua:
		vim.cmd[[colorscheme nord]]
	end
	}
    use {
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
    }
    use {
    'lewis6991/gitsigns.nvim',
    -- tag = 'release' -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
    config = function()
        require('gitsigns').setup()
    end
    }
    use 'chrisbra/csv.vim'
    use 'Olical/conjure'
    use 'Olical/aniseed'
    -- use 'MunifTanjim/nui.nvim'
    use 'chentoast/marks.nvim'
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }
    use({"L3MON4D3/LuaSnip", tag = "v<CurrentMajor>.*"})
    use "rafamadriz/friendly-snippets"
    use "hrsh7th/nvim-cmp"
    use 'Wansmer/treesj'

  if packer_bootstrap then
    require('packer').sync()
  end
  end)






