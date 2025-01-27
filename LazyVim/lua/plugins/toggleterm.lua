return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = true,
    opts = function(_, opts)
      local terminal = require("toggleterm.terminal").Terminal
      local poweshell = terminal:new({ cmd = "pwsh", hidden = true, direction = "float" })

      vim.keymap.set("n", "<leader>t", function()
        poweshell:toggle()
      end, { noremap = true, silent = true })
    end,
  },
}
