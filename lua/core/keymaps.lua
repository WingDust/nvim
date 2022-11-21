-----------------------------------------------------------
-- Define keymaps of Neovim and installed plugins.
-----------------------------------------------------------
-- n 仅正常
-- v 仅视觉和选择
-- o
-- x 仅视觉
-- s 仅选择
-- i 仅插入
-- c 命令行
-----------------------------------------------------------

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end
local opt = { noremap = true, silent = true }


-- Change leader to a comma
-- vim.g.mapleader = '<Space>'
vim.g.mapleader = ' '


-- emacs way
map('i', '<C-h>', '<Del>')
map('i', '<C-f>', '<Right>')
map('i', '<C-b>', '<Left>')
map('i', '<C-p>', '<Up>')
map('i', '<C-n>', '<Down>')
map('i', '<C-a>', '<ESC>^i')
map('i', '<C-e>', '<ESC>$a')

map('n', '<C-s>', '/')


map("v","v","V",opt)
--map("n","<tab>","%",opt)
--
map("n", "<tab>" , "<Plug>(matchup-%)", { noremap = false })
map("n","p",'"+p',opt)
map("n","P",'"+P',opt)
map("v","P",'"+P',opt)
map("v","P",'"+P',opt)

map("t","<ESC>","<C-\\><C-n>",opt)

map('c', '<C-a>', '<home>')


-----------------------------------------------------------
-- plugin
-----------------------------------------------------------
require('Comment').setup()
map("v","X","y'>pgvgcc<esc>'>j",opt)

require('nvim-surround').setup()

-- nvim-toggler
map("n",'<leader>i',"<cmd>lua require('nvim-toggler').toggle<cr>")

-- spectre
vim.cmd([[
nnoremap <leader>S <cmd>lua require('spectre').open()<CR>

"search current word
nnoremap <leader>sw <cmd>lua require('spectre').open_visual({select_word=true})<CR>
vnoremap <leader>s <esc>:lua require('spectre').open_visual()<CR>
"  search in current file
nnoremap <leader>sp viw:lua require('spectre').open_file_search()<cr>
" run command :Spectre
]])


-----------------------------------------------------------
-- gitsigns.nvim
-----------------------------------------------------------
-- Navigation
map('n', ']c', "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", {expr=true})
map('n', '[c', "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", {expr=true})


--map("n","<M-x>",":Legendary<CR>",opt)
map("n","<M-x>",":Telescope commands<CR>",opt)
map("n","<leader>ff","<cmd>lua require('telescope.builtin').find_files()<cr>",opt)

-- hop
map("n", "f",
  "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>"
  , {})
map("n", "F",
  "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>"
  , opt)
map("o", "f",
  "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, inclusive_jump = true })<cr>"
  , opt)
map("o", "F",
  "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, inclusive_jump = true })<cr>"
  , opt)
map("", "t",
  "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>"
  , opt)
map("", "T",
  "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>"
  , opt)
map("n", "<leader>e", "<cmd> lua require'hop'.hint_words({ hint_position = require'hop.hint'.HintPosition.END })<cr>",
  opt)
map("v", "<leader>e", "<cmd> lua require'hop'.hint_words({ hint_position = require'hop.hint'.HintPosition.END })<cr>",
  opt)
map("o", "<leader>e",
  "<cmd> lua require'hop'.hint_words({ hint_position = require'hop.hint'.HintPosition.END, inclusive_jump = true })<cr>"
  , opt)

-- 
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
    opt
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
    opt
)

-- telescope-frecency.nvim
map("n", "<leader><leader>", "<Cmd>lua require('telescope').extensions.frecency.frecency()<CR>", opt)

-----------------------------------------------------------
-- vscode-neovim
-----------------------------------------------------------

vim.cmd([[
nnoremap <silent> za <Cmd>call VSCodeNotify('editor.toggleFold')<CR>
nnoremap <silent> zR <Cmd>call VSCodeNotify('editor.unfoldAll')<CR>
nnoremap <silent> zM <Cmd>call VSCodeNotify('editor.foldAll')<CR>
nnoremap <silent> zo <Cmd>call VSCodeNotify('editor.unfold')<CR>
nnoremap <silent> zO <Cmd>call VSCodeNotify('editor.unfoldRecursively')<CR>
nnoremap <silent> zc <Cmd>call VSCodeNotify('editor.fold')<CR>
nnoremap <silent> zC <Cmd>call VSCodeNotify('editor.foldRecursively')<CR>
nnoremap <silent> z1 <Cmd>call VSCodeNotify('editor.foldLevel1')<CR>
nnoremap <silent> z2 <Cmd>call VSCodeNotify('editor.foldLevel2')<CR>
nnoremap <silent> z3 <Cmd>call VSCodeNotify('editor.foldLevel3')<CR>
nnoremap <silent> z4 <Cmd>call VSCodeNotify('editor.foldLevel4')<CR>
nnoremap <silent> z5 <Cmd>call VSCodeNotify('editor.foldLevel5')<CR>
nnoremap <silent> z6 <Cmd>call VSCodeNotify('editor.foldLevel6')<CR>
nnoremap <silent> z7 <Cmd>call VSCodeNotify('editor.foldLevel7')<CR>
xnoremap <silent> zV <Cmd>call VSCodeNotify('editor.foldAllExcept')<CR>
]])



