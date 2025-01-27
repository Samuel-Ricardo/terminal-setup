return {

  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = function(_, opts)
      local logo = [[
     ██╗██╗   ██╗███████╗████████╗    ███████╗ █████╗ ███╗   ███╗██╗   ██╗███████╗██╗     
     ██║██║   ██║██╔════╝╚══██╔══╝    ██╔════╝██╔══██╗████╗ ████║██║   ██║██╔════╝██║     
     ██║██║   ██║███████╗   ██║       ███████╗███████║██╔████╔██║██║   ██║█████╗  ██║     
██   ██║██║   ██║╚════██║   ██║       ╚════██║██╔══██║██║╚██╔╝██║██║   ██║██╔══╝  ██║     
╚█████╔╝╚██████╔╝███████║   ██║       ███████║██║  ██║██║ ╚═╝ ██║╚██████╔╝███████╗███████╗
 ╚════╝  ╚═════╝ ╚══════╝   ╚═╝       ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝ ╚═════╝ ╚══════╝╚══════╝
                                                                                          
]]
      logo = string.rep("\n", 8) .. logo .. "\n\n"
      opts.config.header = vim.split(logo, "\n")
    end,
  },

  {
    "folke/noice.nvim",
    opts = function(_, opts)
      opts.presets.lsp_doc_border = true
    end,
  },
  {
    "b0o/incline.nvim",
    event = "BufReadPre",
    priority = 1200,
    config = function()
      local helpers = require("incline.helpers")
      local navic = require("nvim-navic")
      local devicons = require("nvim-web-devicons")
      require("incline").setup({
        window = {
          padding = 0,
          margin = { horizontal = 0, vertical = 0 },
        },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
          if filename == "" then
            filename = "[No Name]"
          end
          local ft_icon, ft_color = devicons.get_icon_color(filename)
          local modified = vim.bo[props.buf].modified
          local res = {
            ft_icon and { " ", ft_icon, " ", guibg = ft_color, guifg = helpers.contrast_color(ft_color) } or "",
            " ",
            { filename, gui = modified and "bold,italic" or "bold" },
            guibg = "#44406e",
          }
          if props.focused then
            for _, item in ipairs(navic.get_data(props.buf) or {}) do
              table.insert(res, {
                { " > ", group = "NavicSeparator" },
                { item.icon, group = "NavicIcons" .. item.type },
                { item.name, group = "NavicText" },
              })
            end
          end
          table.insert(res, " ")
          return res
        end,
      })
    end,
  },

  -- animations
  {
    "echasnovski/mini.animate",
    event = "VeryLazy",
    opts = function(_, opts)
      opts.scroll = {
        enable = false,
      }
    end,
  },
}
