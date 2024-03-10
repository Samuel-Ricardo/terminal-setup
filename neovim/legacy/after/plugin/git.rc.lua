local status, git = pcall(require, 'git')
if not status then return end

git.setup {
  keymap = {
    -- Open blame window
    blame = "<Leader>gb",
    -- Open file/folder in git repository
    browse = "<Leader>go"
  }
}

vim.keymap.set("n", "<Leader>gs", ":Git status<CR>")
vim.keymap.set("n", "<Leader>gd", ":Git diff .<CR>")

vim.keymap.set("n", "<Leader>ga", ":Git add <c-r>=expand('%:~:.') <CR>")
vim.keymap.set("n", "<Leader>gc", ":Git commit -m \"[:sparkles:] | create: \" ")
