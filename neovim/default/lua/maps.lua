local keymap = vim.keymap

-- Do not yank with x
keymap.set('n', 'x', '"_x')

-- Increment / decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Delete a word backwards
keymap.set('n', 'dw', 'vb"_d')

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- New tab
keymap.set('n','te',':tabedit<Return>')

-- Split window
keymap.set('n','ss',':split<Return><C-w>w')
keymap.set('n','sv',':vsplit<Return><C-w>w')

-- Move Window
keymap.set('n','<Space>','<C-w>w')
keymap.set('','s<left>','<C-w>h')
keymap.set('','s<up>','<C-w>k')
keymap.set('','s<down>','<C-w>j')
keymap.set('','s<right>','<C-w>l')
keymap.set('','sh','<C-w>h')
keymap.set('','sk','<C-w>k')
keymap.set('','sj','<C-w>j')
keymap.set('','sl','<C-w>l')

-- Resize Window
keymap.set('n','<C-w><left>','<C-w><')
keymap.set('n','<C-w><right>','<c-w>>')
keymap.set('n','<C-w><up>','<C-w>+')
keymap.set('n','<C-w><down>','<C-w>-')

