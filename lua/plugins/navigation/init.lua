return
{
---- file navigation
  {
   'nvim-telescope/telescope.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
    config = function()

    map("n","<M-x>",":Telescope commands<CR>")

    map("n","<leader>ff","<cmd>lua require('telescope.builtin').find_files()<cr>")

-- telescope-frecency.nvim
-- map("n", "<leader><leader>", "<Cmd>lua require('telescope').extensions.frecency.frecency()<CR>", opt)
    end
  },


}
