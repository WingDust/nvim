return {
  'EthanJWright/vs-tasks.nvim',
    dependencies = {
    'nvim-lua/popup.nvim',
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim'
  },
  config = function()
require("vstask").setup({
  cache_json_conf = true, -- don't read the json conf every time a task is ran
  cache_strategy = "last", -- can be "most" or "last" (most used / last used)
  use_harpoon = true, -- use harpoon to auto cache terminals
  telescope_keys = { -- change the telescope bindings used to launch tasks
      vertical = '<C-v>',
      split = '<C-p>',
      tab = '<C-t>',
      current = '<CR>',
  },
  autodetect = { -- auto load scripts
    npm = "on"
  },
  terminal = 'toggleterm',
  term_opts = {
    vertical = {
      direction = "vertical",
      size = "80"
    },
    horizontal = {
      direction = "horizontal",
      size = "10"
    },
    current = {
      direction = "float",
    },
    tab = {
      direction = 'tab',
    }
  }
})

    map("n","<leader>ta","<cmd>lua require('telescope').extensions.vstask.tasks()<CR>")
    map("n","<leader>ti","<cmd>lua require('telescope').extensions.vstask.inputs()<CR>")
    map("n","<leader>th","<cmd>lua require('telescope').extensions.vstask.history()<CR>")
    map("n","<leader>tl","<cmd>lua require('telescope').extensions.vstask.launch()<CR>")

  end
}
