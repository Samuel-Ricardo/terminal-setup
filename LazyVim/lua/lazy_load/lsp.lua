--[[
local lsp_config = require("lspconfig")

lsp_config.gopls.setup({
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = lsp_config.util.root_pattern(".git", "go.mod"),
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      experimentalPostfixCompletions = true,
      analyses = {
        unusedparams = true,
        shadow = true,
      },
      staticcheck = true,
    },
  },
})

return lsp_config
]]

--[[
local _ = {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tailwindcss = {
          -- exclude a filetype from the default_config
          filetypes_exclude = { "markdown" },
          -- add additional filetypes to the default_config
          filetypes_include = { "rust" },
          -- to fully override the default_config, change the below
          -- filetypes = {}
        },
        gopls = {
          settings = {
            gopls = {
              completeUnimported = true,
              usePlaceholders = true,
              experimentalPostfixCompletions = true,
              analyses = {
                unusedparams = true,
                shadow = true,
              },
              staticcheck = true,
            },
          },
        },
      },
      setup = {
        gopls = function(_, opts)
          local gopls = require("lspconfig.server_configurations.gopls")
          --          opts.settings = vim.tbl_deep_extend("force", gopls.default_config.settings, opts.settings)

          opts.filetypes = opts.filetypes or {}
          vim.list_extend(opts.settings, gopls.default_config.settings)

          -- setup cmd
          opts.cmd = { "gopls" }
          -- setup root dir
          opts.root_dir = require("lspconfig.util").root_pattern("go.work", "go.mod", ".git")

          opts = gopls.setup(opts)

          return opts
        end,
        tailwindcss = function(_, opts)
          local tw = require("lspconfig.server_configurations.tailwindcss")
          opts.filetypes = opts.filetypes or {}

          -- Add default filetypes
          vim.list_extend(opts.filetypes, tw.default_config.filetypes)

          -- Remove excluded filetypes
          --- @param ft string
          opts.filetypes = vim.tbl_filter(function(ft)
            return not vim.tbl_contains(opts.filetypes_exclude or {}, ft)
          end, opts.filetypes)

          -- Add additional filetypes
          vim.list_extend(opts.filetypes, opts.filetypes_include or {})
        end,
      },
    },
  },
}
]]
