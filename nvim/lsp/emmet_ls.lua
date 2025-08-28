return {
  cmd = { "emmet-ls", "--stdio" },
  filetypes = {
    "astro", "css", "eruby", "html", "htmlangular", "htmldjango", "javascript", "javascriptreact", "less", "pug", "sass", "scss",
    "svelte", "templ", "typescriptreact", "vue"
  },
  root_markers = { ".git" },

  init_options = {
    hostInfo = "neovim",
    showAbbreviationSuggestions = true,
    showExpandedAbbreviation = "always",
    showSuggestionsAsSnippets = false,
  },
}
