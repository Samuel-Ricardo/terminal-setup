return {
  "Exafunction/codeium.vim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",
  },
  commit = "289eb724e5d6fab2263e94a1ad6e54afebefafb2",
  event = "BufEnter",
  --[[  config = function()
    require("codeium").setup({
      enable_chat = true,
    })
  end, ]]
}
