local _2afile_2a = "fnl\\init.fnl"
local _2amodule_name_2a = "init"
local _2amodule_2a
do
  package.loaded[_2amodule_name_2a] = {}
  _2amodule_2a = package.loaded[_2amodule_name_2a]
end
local _2amodule_locals_2a
do
  _2amodule_2a["aniseed/locals"] = {}
  _2amodule_locals_2a = (_2amodule_2a)["aniseed/locals"]
end
local autoload = (require("aniseed.autoload")).autoload
local nvim = autoload("aniseed.nvim")
do end (_2amodule_locals_2a)["nvim"] = nvim
local function _1_()
  return print("Hello World")
end
vim.api.nvim_create_user_command("Salute", _1_, {bang = true, desc = "This is a description"})
local function cursor_line_pos()
  local pos = nvim.win_get_cursor(0)
  return pos[1]
end
_2amodule_2a["cursor-line-pos"] = cursor_line_pos
local function insert_lines(lines)
  return nvim.buf_set_lines(0, 0, 0, false, lines)
end
_2amodule_2a["insert-lines"] = insert_lines
local function insert_current_pos(lines)
  local pos = cursor_line_pos()
  return nvim.buf_set_lines(0, pos, pos, false, lines)
end
_2amodule_2a["insert-current-pos"] = insert_current_pos
local function log()
  local cword = nvim.fn.expand("<cword>")
  do local _ = ("console.log(\"" .. cword .. "\"," .. cword .. ")") end
  cursor_line_pos()
  return insert_current_pos({("console.log(\"" .. cword .. "\"," .. cword .. ")")})
end
vim.api.nvim_create_user_command("Log", log, {bang = true, desc = "JS insert  log var "})
local function get_cursor_pos()
  return {vim.fn.line("."), vim.fn.col(".")}
end
local function repdot()
  vim.cmd("normal gv")
  return vim.cmd(":'<,'>s/\\([^?]\\)\\./\\1?./g")
  --return vim.cmd(":'<,'>s/\\([^?|\\.|\\d]\\)\\./\\1?.")
end
vim.api.nvim_create_user_command("JsRangeAddDot", repdot, {bang = true, desc = "range . to ?."})
local function read_word()
  return nvim.fn.expand("<cword>")
end
_2amodule_2a["read-word"] = read_word
local function iepdot()
  local cword = nvim.fn.expand("<cword>")
  if (cword == "true") then
    return nvim.command(("normal ciw" .. "false"))
  elseif (cword == "false") then
    return nvim.command(("normal ciw" .. "true"))
  else
    return nil
  end
end
vim.api.nvim_create_user_command("ToggleWord", iepdot, {bang = true, desc = "flip word"})
local function bre()
  return vim.cmd(": s/\\( str\\|:str\\|class\\|:class\\|style\\|:style\\|@click\\|\\> \\)/\\r\\1/g")
end
vim.api.nvim_create_user_command("Brea", bre, {bang = true, desc = "range . to ?."})
do
  local x = math.random(64)
  if (0 == (x % 2)) then
    print(x)
  elseif (0 == (x % 9)) then
    print(x)
  else
    print("I dunno, something else", x)
  end
end
return _2amodule_2a
