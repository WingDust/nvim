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

-- local function map(mode, lhs, rhs, opts)
--   local options = { noremap = true, silent = true }
--   if opts then
--     options = vim.tbl_extend('force', options, opts)
--   end
--   vim.api.nvim_set_keymap(mode, lhs, rhs, options)
-- end
-- local opt = { noremap = true, silent = true }


-- Change leader to a comma
-- vim.g.mapleader = '<Space>'
vim.g.mapleader = ' '
vim.g.maplocalleader = ','


-- emacs way
map('i', '<C-h>', '<Del>')
map('i', '<C-f>', '<Right>')
map('i', '<C-b>', '<Left>')
map('i', '<C-p>', '<Up>')
map('i', '<C-n>', '<Down>')
map('i', '<C-a>', '<ESC>^i')

map('i', '<C-e>', '<end>')
map('c', '<C-a>', '<home>')

map('n', '<C-s>', '/')

map('n', '<C-x><C-c>', ':wa | qa<cr>')


map("n","V","<C-v>")
-- map("v","v","V",opt)
map("v","v","V")
--map("n","<tab>","%",opt)
--
-- map("n", "<tab>" , "<Plug>(matchup-%)", { noremap = false })
-- map("v", "<tab>" , "<Plug>(matchup-%)", { noremap = false })

map("n","p",'"+p')
map("n","P",'"+P')
map("v","P",'"+P')
map("v","P",'"+P')


map("t","<ESC>","<C-\\><C-n>")

-- [vim - remapping &gt;&gt; &lt;&lt; (indent commands)](https://stackoverflow.com/questions/8394598/vim-remapping-indent-commands)
map('n',">",">>")
map('n',"<","<<")


-- map("v","<M-x>",":<Del><Del> Telescope commands",opt)

-----------------------------------------------------------
-- plugin
-----------------------------------------------------------


-----------------------------------------------------------
-- font-resize
-----------------------------------------------------------
-- map("n","<C-+>","<cmd>:GUIFontSizeUp<CR>")
-- map("n","<C-->","<cmd>:GUIFontSizeDown<CR>")
-- map("n","<C-+>","<cmd>:GUIFontSizeUp<CR>")




map("v","X","y'>pgvgcc<esc>'>j",opt)


-- nvim-toggler
-- map("n",'<leader>i',"<cmd>lua require('nvim-toggler').toggle<cr>")

-- spectre
-- vim.cmd([[
-- nnoremap <leader>S <cmd>lua require('spectre').open()<CR>
--
-- "search current word
-- nnoremap <leader>sw <cmd>lua require('spectre').open_visual({select_word=true})<CR>
-- vnoremap <leader>s <esc>:lua require('spectre').open_visual()<CR>
-- "  search in current file
-- nnoremap <leader>sp viw:lua require('spectre').open_file_search()<cr>
-- " run command :Spectre
-- ]])



--map("n","<M-x>",":Legendary<CR>",opt)

-----------------------------------------------------------
-- vscode-neovim
-----------------------------------------------------------

if vim.g.vscode then
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
else
end



