vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set('i','jk','<Esc>')
keymap.set('n','<leader>sv','<C-w>v')
keymap.set('n','<leader>sx',':close<cr>')

keymap.set('n','<leader>e',':NvimTreeToggle<cr>')


keymap.set('n','<leader>ff','<cmd>Telescope find_files<cr>')
keymap.set('n','<leader>fg','<cmd>Telescope live_grep<cr>')
keymap.set('n','<leader>fb','<cmd>Telescope buffers<cr>')
keymap.set('n','<leader>fh','<cmd>Telescope help_tags<cr>')

keymap.set('n','<leader>hw',':HopWord<cr>')
keymap.set('n','<leader>hww',':HopWordMW<cr>')
keymap.set('n','<leader>hc',':HopChar2<cr>')
keymap.set('n','<leader>hcc',':HopChar2MW<cr>')
keymap.set('n','<leader>hl',':HopLine<cr>')
keymap.set('n','<leader>hls',':HopLineStart<cr>')

keymap.set('n','<leader>sm',':MaximizerToggle<cr>')
-- Lua
keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>",
  {silent = true, noremap = true}
)
keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>",
  {silent = true, noremap = true}
)
keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>",
  {silent = true, noremap = true}
)
keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>",
  {silent = true, noremap = true}
)
keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",
  {silent = true, noremap = true}
)
keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>",
  {silent = true, noremap = true}
)
-- TermToggle
keymap.set('n','<leader>tt',':TermToggle<cr>')

-- markdown preview
keymap.set('n','<leader>mp',':MarkdownPreview<cr>')
keymap.set('n','<leader>mps',':MarkdownPreviewStop<cr>')
keymap.set('n','<leader>mpt',':MarkdownPreviewToggle<cr>')

