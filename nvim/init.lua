vim.g.mapleader = " "

vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.swapfile = false
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.winborder = "rounded"
vim.opt.splitright = true
vim.opt.splitbelow = true

vim.diagnostic.config({
  virtual_lines = true,
  -- virtual_text = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = "rounded",
    source = true,
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "󰅚 ",
      [vim.diagnostic.severity.WARN] = "󰀪 ",
      [vim.diagnostic.severity.INFO] = "󰋽 ",
      [vim.diagnostic.severity.HINT] = "󰌶 ",
    },
    numhl = {
      [vim.diagnostic.severity.ERROR] = "ErrorMsg",
      [vim.diagnostic.severity.WARN] = "WarningMsg",
    },
  },
})

vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })
vim.keymap.set("n", "<leader>sk", "10<C-w>>", { desc = "Increase window width" })
vim.keymap.set("n", "<leader>sj", "10<C-w><", { desc = "Decrease window width" })

vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover Documentation" })
vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "Format" })
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Goto Declaration" })

vim.keymap.set("v", "<leader>cl", function() -- console.log("highlightedText:", highlightedText) on new line
  vim.cmd("normal! y")
  local reg = vim.fn.getreg('"')
  vim.api.nvim_feedkeys("oconsole.log('" .. reg .. ":', " .. reg .. ");", "n", false)
end, { desc = "console.log() highlighted text" })

vim.pack.add({
  'https://github.com/folke/tokyonight.nvim',
  'https://github.com/christoomey/vim-tmux-navigator',
  'https://github.com/windwp/nvim-autopairs',
  'https://github.com/nvim-tree/nvim-web-devicons',
  'https://github.com/nvim-lualine/lualine.nvim',
  'https://github.com/neovim/nvim-lspconfig',
  'https://github.com/mason-org/mason.nvim',
  'https://github.com/mason-org/mason-lspconfig.nvim',
  'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim',
  'https://github.com/nvim-treesitter/nvim-treesitter',
  'https://github.com/saghen/blink.cmp',
  'https://github.com/folke/snacks.nvim'
})

require('tokyonight').setup({
  transparent_background = true
})
vim.cmd("colorscheme tokyonight")
require('nvim-autopairs').setup()
require("nvim-web-devicons").setup()
require('lualine').setup({
  options = {
    theme = "gruvbox-material",
  },
  sections = {
    lualine_c = { { 'filename', path = 1 } }
  }
})
require('mason').setup()
require('mason-lspconfig').setup()
require('mason-tool-installer').setup({
  ensure_installed = {
    'cssls',
    'emmet_ls',
    'eslint',
    'html',
    'lua_ls',
    'prettierd',
    'svelte',
    'tailwindcss',
    'ts_ls'
  }
})
require('nvim-treesitter.configs').setup({
  auto_install = true,
  highlight = { enable = true },
  indent = { enable = true },
})
require("blink.cmp").setup({
  keymap = { preset = 'default' },
  appearance = {
    nerd_font_variant = 'mono'
  },
  completion = { documentation = { auto_show = true } },
  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer' },
  },
  fuzzy = { implementation = "lua" }
})

local Snacks = require("snacks")
Snacks.setup({
  indent = {},
  picker = {},
  explorer = {}
})

vim.keymap.set("n", "<leader>gg", function() Snacks.lazygit() end, { desc = "Lazygit" })
vim.keymap.set("n", "<C-p>", function() Snacks.picker.smart() end, { desc = "Smart Find Files" })
vim.keymap.set("n", "<leader>fg", function() Snacks.picker.grep() end, { desc = "Grep" })
vim.keymap.set("n", "<C-n>", function() Snacks.explorer() end, { desc = "Grep" })
