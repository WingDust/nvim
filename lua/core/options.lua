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

if jit.os=='Windows'
    then
vim.cmd 'source C:/Users/Administrator/AppData/Local/nvim/vim/matchit.vim'
end
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

-- Enable Aniseed's automatic compilation and loading of Fennel source code.
vim.g["aniseed#env"] = {
  module = "init",
  compile = true
}
