local status, gitsigns = pcall(require, 'gitsigns')
if not status then return end

gitsigns.setup {}

vim.keymap.set('n', '<Leader>gj', function() gitsigns.next_hunk() end)
vim.keymap.set('n', '<Leader>gk', function() gitsigns.prev_hunk() end)
vim.keymap.set('n', '<Leader>ghp', '<cmd>:Gitsigns preview_hunk<cr>')
