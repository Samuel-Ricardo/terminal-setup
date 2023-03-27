local status, nvim_lsp = pcall(require, 'lspconfig')
if (not status) then return end

local protocol = require('vim.lsp.protocol')

local on_attach = function(client, bufnr)
  --formating
  if client.server_capabilities.documentFormatttingProvider then
    vim.api.nvim_command [[augroup Format]]
    vim.api.nvim_command [[autocmd! * <buffer>]]
    vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
    vim.api.nvim_command [[augroup END]]
  end
end


-- Languages setup


-- Typescript Config 
nvim_lsp.tsserver.setup {
  on_attach = on_attach,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact", "javascript.jsx" },
  cmd = { "typescript-language-server.cmd", "--stdio" },
  capabilities = capabilities
}

-- Lua Config
nvim_lsp.sumneko_lua.setup {
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostic = {
        -- Get the langguage server to recognize the 'vim' global
        globals = { 'vim' }
      },

      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false
      }
    }
  }
}

-- Go Lang setup
  nvim_lsp.gopls.setup {
   on_attach = on_attach 
}

-- Go Linters Setup

--  

-- CSS Config
 nvim_lsp.cssls.setup {
  on_attach = on_attach
}


-- Docker Setup

-- Docker Config
  nvim_lsp.dockerls.setup {
  on_attach = on_attach
}

-- Docker Compose Config
  nvim_lsp.docker_compose_language_service.setup {
  on_attach = on_attach
}

-- Yaml Config
  nvim_lsp.yamlls.setup { on_attach = on_attach }
