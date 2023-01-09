return {
{
     "kylechui/nvim-surround",
     run = function()
         require("nvim-surround").setup({
             -- Configuration here, or leave empty to use defaults
         })
     end
 },
 {'andymass/vim-matchup',
 config =function()
    map("n", "<tab>" , "<Plug>(matchup-%)", { noremap = false })
    map("v", "<tab>" , "<Plug>(matchup-%)", { noremap = false })
 end

 },
 {'Vonr/align.nvim',
 config=function()

  local opt = { noremap = true, silent = true }
vim.keymap.set('x', 'aa', function() require'align'.align_to_char(1, true)             end, opt) -- Aligns to 1 character, looking left
vim.keymap.set('x', 'as', function() require'align'.align_to_char(2, true, true)       end, opt) -- Aligns to 2 characters, looking left and with previews
vim.keymap.set('x', 'aw', function() require'align'.align_to_string(false, true, true) end, opt) -- Aligns to a string, looking left and with previews
vim.keymap.set('x', 'ar', function() require'align'.align_to_string(true, true, true)  end, opt) -- Aligns to a Lua pattern, looking left and with previews


-- Example gawip to align a paragraph to a string, looking left and with previews
vim.keymap.set(
    'n',
    'gaw',
    function()
        local a = require'align'
        a.operator(
            a.align_to_string,
            { is_pattern = false, reverse = true, preview = true }
        )
    end,
    { noremap = true, silent = true }
)

-- Example gaaip to aling a paragraph to 1 character, looking left
vim.keymap.set(
    'n',
    'gaa',
    function()
        local a = require'align'
        a.operator(
            a.align_to_char,
            { reverse = true }
        )
    end,
    { noremap = true, silent = true }
)

 end



 },
{
     'numToStr/Comment.nvim',
     config = function()
         require('Comment').setup()
     end
 },

 ---- buffer  navigation
{
 'phaazon/hop.nvim',
 config = function()
   -- you can configure Hop the way you like here; see :h hop-config
   require 'hop'.setup { keys = 'qwertyuiopasdfghjklzxcvbnm' }

map("n", "f", "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>" )
map("n", "F", "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>" )
map("o", "f", "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, inclusive_jump = true })<cr>")
map("o", "F", "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, inclusive_jump = true })<cr>")
map("", "t", "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>")
map("", "T", "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>")
map("n", "<leader>e", "<cmd> lua require'hop'.hint_words({ hint_position = require'hop.hint'.HintPosition.END })<cr>")
map("v", "<leader>e", "<cmd> lua require'hop'.hint_words({ hint_position = require'hop.hint'.HintPosition.END })<cr>")
map("o", "<leader>e", "<cmd> lua require'hop'.hint_words({ hint_position = require'hop.hint'.HintPosition.END, inclusive_jump = true })<cr>")


 end
},

   { 
      'windwp/nvim-autopairs',
      run = function() require('nvim-autopairs').setup({ }) 
  end,
  },
  { 
      'windwp/nvim-ts-autotag',
      run = function() require('nvim-ts-autotag').setup({ 
          filetypes = { "html" , "xml" , "vue" , "js" ,"jsx" },
      }) 
  end,
  },

  { 'smithbm2316/centerpad.nvim' },
  -- 像编辑buffer 一样编辑文件目录
  { 'elihunter173/dirbuf.nvim' },
  { 'chentoast/marks.nvim'},
  {'nvim-tree/nvim-tree.lua',},

  {"L3MON4D3/LuaSnip"},
  { "rafamadriz/friendly-snippets"},

  {  'hrsh7th/vim-vsnip'},
  {   'hrsh7th/vim-vsnip-integ'},
  {'hrsh7th/cmp-buffer'} ,              -- Completion source
  {"hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-path"     },
  { "hrsh7th/cmp-cmdline"  },
  { "hrsh7th/nvim-cmp",
  config = function()
local cmp = require'cmp'
      cmp.setup(
{
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-p>"] = cmp.mapping.select_prev_item(),
     	["<C-n>"] = cmp.mapping.select_next_item(),
      -- ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      -- ['<C-f>'] = cmp.mapping.scroll_docs(4),
      -- ['<C-Space>'] = cmp.mapping.complete(),
		["<tab>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true}), 
      ['<C-e>'] = cmp.mapping.abort(),
      -- ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
        -- { name = 'nvim_lsp' },
        { name = 'vsnip' }, -- For vsnip users.
        -- { name = 'luasnip' }, -- For luasnip users.
        -- { name = 'ultisnips' }, -- For ultisnips users.
        -- { name = 'snippy' }, -- For snippy users.
        { name = 'buffer' },
        { name = "nvim_lsp", group_index = 1 },
        { name = "nvim_lsp_signature_help", group_index = 1 },
		{ name = "path", group_index = 2 },
        })
  }

      )

  end

  },


    -- lsp support
   {'williamboman/mason.nvim' ,
    config = function()
require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
    'tsserver',
    -- 'eslint',
    -- 'html',
    -- 'cssls'
  }
})
    end
   },           -- Installer for external tools
   {'williamboman/mason-lspconfig.nvim'},
   { 'neovim/nvim-lspconfig',
   config = function()
        require'lspconfig'.pyright.setup{}

        require'lspconfig'.tsserver.setup {}
   end
   }




}
