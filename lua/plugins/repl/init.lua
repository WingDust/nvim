return  {

    {'Olical/conjure',
    config = function()
    vim.g.maplocalleader = ','
    end
},
    { 'Olical/aniseed',
    config = function()
-- Enable Aniseed's automatic compilation and loading of Fennel source code.
vim.g["aniseed#env"] = {
  module = "init",
  compile = true
}
    end

}
}
