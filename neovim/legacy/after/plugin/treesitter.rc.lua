local status, ts = pcall (require, 'nvim-treesitter.configs')
if (not status) then return end

ts.setup{
  highlight = {
    enable = true,
    disable = {}
  },
  
  indent = {
    enable = true,
    disable = {}
  },
  
 ensure_installed = {
    'tsx',
    'typescript',
    'javascript',
    'prisma',
    'lua',
    'json',
    'html',
    'scss',
    'css',
    'c',
    'go',
    'regex',
    'bash',
		'help',
		'vim',
    'markdown',
		'markdown_inline'
  },

  autotag = {
    enable = true
  }
}
