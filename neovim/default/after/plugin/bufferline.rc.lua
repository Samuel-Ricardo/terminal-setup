local status, bufferline = pcall(require, 'bufferline')
if (not status) then return end

bufferline.setup ({
  options = {
    mode = "tabs",
    separator_style = 'slant',
    always_show_bufferline = false,
    show_buffer_close_icons = false,
    show_close_icons = false,
    color_icons = true,
    diagnostics = 'nvim_lsp',
    diagnostics_update_in_insert = true,
    groups = {
      options = {
        toggle_hidden_on_enter = true,
      },
      items = {
      {
        name = "Tests", -- Mandatory
        highlight = {underline = true, sp = "blue"}, -- Optional
        priority = 2, -- determines where it will appear relative to other groups (Optional)
        icon = "", -- Optional
        matcher = function(buf) -- Mandatory
          return buf.filename:match('%_test') or buf.filename:match('%_spec')
        end,
      },
      {
        name = "Docs",
        icon = "🖺",
        highlight = {undercurl = true, sp = "green"},
        auto_close = false,  -- whether or not close this group if it doesn't contain the current buffer
        matcher = function(buf)
          return buf.filename:match('%.md') or buf.filename:match('%.txt') or buf.filename:match('%.doc%')
        end,
        separator = { -- Optional
          style = require('bufferline.groups').separator.tab
        },
      }
    },
  }
},
  highlights = {
    separator = {
      fg = '#073642',
      bg = '#002b36'
    },
    separator_selected = {
      fg = '#073642'
    },
    background = {
      fg = '#657b83',
      bg = '#002b36'
    },
    buffer_selected = {
      fg = '#fdf6e3',
      bold = true
    },
    fill = {
      bg = '#073642'
    }
  }
})

vim.keymap.set('n', '<Tab>', '<cmd>BufferLineCycleNext<cr>', {})
-- vim.keymap.set('n', '<S-Tab>', '<cmd>bufferlineCyclePrev<cr>', {})

vim.keymap.set('n', '<S-Tab>', '<cmd>:tabnew<cr>')
vim.keymap.set('n', '<A-z>', '<cmd>BufferLinePick<cr>', {})

vim.keymap.set('n', 'e', '<cmd>BufferLinePickClose<cr>', {})
