-----------------------------------------------------------
-- General Neovim settings and configuration
-----------------------------------------------------------

-- Default options are not included
-- See: https://neovim.io/doc/user/vim_diff.html
-- [2] Defaults - *nvim-defaults*
--
--
--

local g = vim.g       -- Global variables
local opt = vim.opt   -- Set options (global/buffer/windows-scoped)

-----------------------------------------------------------
-- General
-----------------------------------------------------------
opt.mouse = 'a'                       -- Enable mouse support
opt.clipboard = 'unnamedplus'         -- Copy/paste to system clipboard
opt.cursorline = true
opt.swapfile = false                  -- Don't use swapfile
opt.completeopt = 'menuone,noinsert,noselect'  -- Autocomplete options

-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
opt.relativenumber = true
opt.number = true          -- Show line number
opt.showmatch = true        -- Highlight matching parenthesis
opt.foldmethod = 'marker'   -- Enable folding (default 'foldmarker')
--opt.colorcolumn = '80'      -- Line lenght marker at 80 columns
opt.splitright = true       -- Vertical split to the right
opt.splitbelow = true       -- Horizontal split to the bottom
opt.ignorecase = true       -- Ignore case letters when search
opt.smartcase = true        -- Ignore lowercase for the whole pattern
opt.linebreak = true        -- Wrap on word boundary
opt.termguicolors = true    -- Enable 24-bit RGB colors
opt.laststatus=3            -- Set global statusline

-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
opt.expandtab = true        -- Use spaces instead of tabs
opt.shiftwidth = 4          -- Shift 4 spaces when tab
opt.tabstop = 4             -- 1 tab == 4 spaces
opt.smartindent = true      -- Autoindent new lines

-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
opt.hidden = true           -- Enable background buffers
opt.history = 100           -- Remember N lines in history
opt.lazyredraw = true       -- Faster scrolling
opt.synmaxcol = 240         -- Max column for syntax highlight
opt.updatetime = 700        -- ms to wait for trigger an event

-----------------------------------------------------------
-- Startup
-----------------------------------------------------------
-- Disable nvim intro
opt.shortmess:append "sI"



-- [How to jump to matching angle-bracket &lt; &gt; using %](https://www.reddit.com/r/vim/comments/kr9rnu/how_to_jump_to_matching_anglebracket_using/)

-- set matchpairs+=<:>
vim.cmd([[


function DateInsert()
    $read !date
endfunction

:filetype plugin on


]])

-- [Vimscript is still our friend](https://vonheikemen.github.io/devlog/tools/configuring-neovim-using-lua/)

if jit.os=='Windows' then
-- vim.cmd 'source C:/Users/Administrator/AppData/Local/nvim/vim/matchit.vim'
vim.cmd([[
set shell=elvish
  "set shell=pwsh\ -NoLogo shellpipe=\| shellxquote=
  "  set shellcmdflag=-NoLogo\ -NoProfile\ -ExecutionPolicy\ RemoteSigned\ -Command
  "  set shellredir=\|\ Out-File\ -Encoding\ UTF8
  "set shellredir=\|\ Out-File\ -Encoding\ UTF8
]])
end

vim.cmd([[
" 设置 Markdown 的缩进折叠
"
" https://stackoverflow.com/questions/3828606/vim-markdown-folding
function! MarkdownLevel()
    let curline = getline(v:lnum)
    if curline =~ '^# .*$'
        return ">1"
    endif
    if curline =~ '^## .*$'
        return ">2"
    endif
    if curline =~ '^### .*$'
        return ">3"
    endif
    if curline =~ '^#### .*$'
        return ">4"
    endif
    if curline =~ '^##### .*$'
        return ">5"
    endif
    if curline =~ '^###### .*$'
        return ">6"
    endif
    return "="
endfunction

function! MarkdownFoldText()
    let foldsize = v:foldend - v:foldstart
    return getline(v:foldstart).' ('.foldsize.' lines)'
endfunction

au BufEnter *.md setlocal foldexpr=MarkdownLevel()
au BufEnter *.md setlocal foldmethod=expr
au BufEnter *.md setlocal foldtext=MarkdownFoldText()

]])


--

local function get_visual_selection()
  local s_start = vim.fn.getpos("'<")
  local s_end = vim.fn.getpos("'>")
  local n_lines = math.abs(s_end[2] - s_start[2]) + 1
  local lines = vim.api.nvim_buf_get_lines(0, s_start[2] - 1, s_end[2], false)
  lines[1] = string.sub(lines[1], s_start[3], -1)
  if n_lines == 1 then
    lines[n_lines] = string.sub(lines[n_lines], 1, s_end[3] - s_start[3] + 1)
  else
    lines[n_lines] = string.sub(lines[n_lines], 1, s_end[3])
  end
  return table.concat(lines, '\n')
end


function snake_case()
    -- expand('<cword>') to get the current word under cursor
    local current_word = vim.call('expand','<cword>') 
    -- change case
    -- local snake_case_word = string.gsub(current_word, "(%u)", "_%1" )
    -- diw delete in word
    -- i insert
    -- and add snake_case_word
    -- vim.cmd("normal! diwi" ..  snake_case_word)
end


vim.api.nvim_create_user_command(
  'OpenURL', 
  function(opts) 
    -- print(opts)
    -- print(get_visual_selection())
    print(snake_case())
    -- cmd = ("open itter.js")
    -- os.execute(cmd)
  end,
  { nargs = '*' }
  )

----------
-- examples for your init.lua

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true





-----------------------------------------------------------
-- gui-font-resize
-----------------------------------------------------------
-- require("gui-font-resize").setup({ default_size = 10, change_by = 1, bounds = { maximum = 20 } })



-- 全局变量
g.autosave = true
g.timerId = 0

local autosave = vim.api.nvim_create_augroup("autosave",{clear=true})

vim.api.nvim_create_autocmd({"TextChanged","TextChangedI"},{
    group=autosave,
    callback = function()
        print(g.timerId)
        if (g.autosave==false) then return 
        else
            if (g.timerId~=0) then
                print('sotp timer')
                vim.fn.timer_stop(g.timerId)
                g.timerId=0
            else
                print('start timer')
           g.timerId=  vim.fn.timer_start(3000,function ()
              print('run save')
              local get_all_buffers = function() return vim.api.nvim_list_bufs()end
              print(get_all_buffers())
              for k,v in ipairs(vim.api.nvim_list_bufs()) do
                  print(vim.api.nvim_buf_get_name(v),vim.fn.matchstr(vim.api.nvim_buf_get_name(v),'packer_init.lua'),''==vim.api.nvim_buf_get_name(v) )
                  if (''==vim.api.nvim_buf_get_name(v)) then goto continue end
                  if (vim.fn.matchstr(vim.api.nvim_buf_get_name(v),'packer_init.lua') ) then goto continue end

                  print(
                  k,
                  v,
                  'acss',
                  vim.api.nvim_buf_is_valid(v),vim.api.nvim_buf_get_name(v),
                  ':w '..vim.api.nvim_buf_get_name(v)
                  )
                  -- vim.cmd(':w'..)
                  ::continue:: 
              end

          end)
            end
        end


    end

})


--
--
--
local recursive = {
  split = {
    recursive = true,
    recursive_ignore = {
      'arguments',
      'parameters',
      'formal_parameters',
    },
  },
}

local langs = {
  javascript = {
    object = { split = recursive.split },
    array = { split = recursive.split },
    statement_block = { split = recursive.split },
  },
}

local opts = {
  use_default_keymaps = true,
  check_syntax_error = true,
  max_join_length = 1000,
  cursor_behavior = 'hold',
  notify = true,
  langs = langs,
}

    local tsj = require('treesj')
    tsj.setup(opts)
