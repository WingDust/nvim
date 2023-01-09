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


-- emacs way
map('i', '<C-h>', '<Del>')
map('i', '<C-f>', '<Right>')
map('i', '<C-b>', '<Left>')
map('i', '<C-p>', '<Up>')
map('i', '<C-n>', '<Down>')
map('i', '<C-a>', '<ESC>^i')
map('i', '<C-e>', '<ESC>$a')

map('c', '<C-a>', '<home>')

map('n', '<C-s>', '/')


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



-- map("v","<M-x>",":<Del><Del> Telescope commands",opt)

-----------------------------------------------------------
-- plugin
-----------------------------------------------------------

-- require'marks'.setup {
--   -- whether to map keybinds or not. default true
--   default_mappings = true,
--   -- which builtin marks to show. default {}
--   builtin_marks = { ".", "<", ">", "^" },
--   -- whether movements cycle back to the beginning/end of buffer. default true
--   cyclic = true,
--   -- whether the shada file is updated after modifying uppercase marks. default false
--   force_write_shada = false,
--   -- how often (in ms) to redraw signs/recompute mark positions. 
--   -- higher values will have better performance but may cause visual lag, 
--   -- while lower values may cause performance penalties. default 150.
--   refresh_interval = 250,
--   -- sign priorities for each type of mark - builtin marks, uppercase marks, lowercase
--   -- marks, and bookmarks.
--   -- can be either a table with all/none of the keys, or a single number, in which case
--   -- the priority applies to all marks.
--   -- default 10.
--   sign_priority = { lower=10, upper=15, builtin=8, bookmark=20 },
--   -- disables mark tracking for specific filetypes. default {}
--   excluded_filetypes = {},
--   -- marks.nvim allows you to configure up to 10 bookmark groups, each with its own
--   -- sign/virttext. Bookmarks can be used to group together positions and quickly move
--   -- across multiple buffers. default sign is '!@#$%^&*()' (from 0 to 9), and
--   -- default virt_text is "".
--   bookmark_0 = {
--     sign = "⚑",
--     virt_text = "hello world",
--     -- explicitly prompt for a virtual line annotation when setting a bookmark from this group.
--     -- defaults to false.
--     annotate = false,
--   },
--   mappings = {}
-- }



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

-----------------------------------------------------------
-- LuaSnip
-----------------------------------------------------------

vim.cmd([[
" press <Tab> to expand or jump in a snippet. These can also be mapped separately
" via <Plug>luasnip-expand-snippet and <Plug>luasnip-jump-next.
imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 
" -1 for jumping backwards.
inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>

snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>

" For changing choices in choiceNodes (not strictly necessary for a basic setup).
imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
]])


