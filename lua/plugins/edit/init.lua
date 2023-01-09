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
         --print('Comment')
         require('Comment').setup()
     end
 },

}
