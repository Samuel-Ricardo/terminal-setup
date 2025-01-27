-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

local cmp = require("cmp")

local config = cmp.get_config()
table.insert(config.sources, { name = "codeium" })
cmp.setup(config)

--[[
cmp.setup({
  sources = {
    { name = "codeium" },
    { name = "nvim_lsp" },
    { name = "buffer" },
    { name = "path" },
  },
})
]]

-- Open CMP
keymap.set("i", "<C-z>", cmp.complete, opts)

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Delete a word backwards
keymap.set("n", "dw", 'vb"_d')

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- New tab
keymap.set("n", "te", ":tabedit")
keymap.set("n", "q<tab>", ":tabnext<Return>", opts)
--keymap.set("n", "q<Leader-tab>", ":tabprev<Return>", opts)

-- Buffers
keymap.set("n", "<tab>", ":BufferLineCycleNext<cr>", opts)
--keymap.set("n", "<Leader>", ":BufferLineCyclePrev<cr>", opts)
keymap.set("n", "E", ":bd<cr>", opts)

-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)

-- Move window
keymap.set("n", "<A-left>", "<C-w>h")
keymap.set("n", "<A-up>", "<C-w>k")
keymap.set("n", "<A-down>", "<C-w>j")
keymap.set("n", "<A-right>", "<C-w>l")

-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

-- EXIT

keymap.set("n", "Q", ":q<CR>")
keymap.set("n", "<C-e>", ":wqa<CR>")

keymap.set("i", "<C-c>", function()
  return vim.fn["codeium#Accept"]()
end, { expr = true, silent = true })

--[[
]]
-- GIT

-- keymap.set("n", "<leader-g-a>", ":Gitsigns stage_buffer")

-- TOGGLE TERM

keymap.set("n", "<leader>tt", ":ToggleTerm<cr>")
--keymap.set("n", "<leader>t", ":ToggleTerm direction=float<cr>")
keymap.set("n", "<leader>th", ":ToggleTerm size=10 direction=horizontal<cr>")
keymap.set("n", "<leader>tv", ":ToggleTerm size=80 direction=vertical<cr>")
