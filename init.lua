vim.cmd [[
    let g:python3_host_prog='C:/Users/foo/Envs/neovim3/Scripts/python.exe'
    let g:python_host_prog='C:/Users/foo/Envs/neovim/Scripts/python.exe'
]]

require('core.options')
require('core.keymaps')
require('core.lazy')
require('plugins.mason')
require('plugins.nvim-tree')
require('plugins.trouble')
require('plugins.treesitter')
require('plugins.bufferline')
