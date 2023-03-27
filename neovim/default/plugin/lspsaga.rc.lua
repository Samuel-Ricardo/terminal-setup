local status, saga = pcall(require, 'lspsaga')
if (not status) then return  end

saga.setup {
  -- server_filetype_map = {}
  ui = {
    windblend = 10,
    border = 'rounded',
    colors = { normal_bg = '#002b36' },
  }
}

local opts = { noremap = true, silent = false }

-- Normal Mode
vim.keymap.set('n', 'k', '<Cmd>Lspsaga hover_doc<CR>', opts)
vim.keymap.set('n', 'o', '<Cmd>Lspsaga outline<cr>', opts)
vim.keymap.set('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
vim.keymap.set('n', 'gl', '<Cmd>Lspsaga show_line_diagnostics<CR>', opts)
vim.keymap.set('n', 'ga', '<Cmd>Lspsaga code_action<cr>', opts)
vim.keymap.set('n', 'gf', '<Cmd>Lspsaga lsp_finder<CR>', opts)
vim.keymap.set('n', 'gp', '<Cmd>Lspsaga peek_definition<CR>', opts)
vim.keymap.set('n', 'gr', '<Cmd>Lspsaga rename<CR>', opts)


--- Insert Mode
vim.keymap.set('i', '<C-b>','<Cmd>Lspsaga rename<cr>', opts)
vim.keymap.set('i', '<C-k>', '<Cmd>lua vim.lsp.buf.signature_help()<CR>', opts)

-- vim.keymap.set('i', '<C-k>', '<Cmd>Lspsaga signature_help<CR>', opts)
--vim.keymap.set('i', '<C>', '<Cmd>Lspsaga hover_doc', opts)
--vim.keymap.set('i', '<S>', '<Cmd>Lspsaga show_line_diagnostics<cr>', opts)
--vim.keymap.set('i', '<A-S>', '<Cmd>Lspsaga outline<cr>', opts)
--vim.keymap.set('i', '<S-S>', '<Cmd>Lspsaga code_action<cr>', opts)
