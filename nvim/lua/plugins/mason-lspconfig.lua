return {
  "williamboman/mason-lspconfig.nvim",
  config = function()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
        "html",
        "cssls",
        "ts_ls",
        "svelte",
        "tailwindcss",
        "emmet_language_server",
        "eslint@4.8.0",
        "pyright",
        "ruff",
      },
    })
  end,
}
