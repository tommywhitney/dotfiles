return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })
      lspconfig.html.setup({
        capabilities = capabilities,
      })
      lspconfig.cssls.setup({
        capabilities = capabilities,
      })
      local function organize_imports()
        local params = {
          command = "_typescript.organizeImports",
          arguments = { vim.api.nvim_buf_get_name(0) },
          title = "",
        }
        vim.lsp.buf.execute_command(params)
      end
      lspconfig.ts_ls.setup({
        capabilities = capabilities,
        commands = {
          OrganizeImports = {
            organize_imports,
            description = "Organize Imports",
          },
        },
      })
      lspconfig.pyright.setup({
        capabilities = capabilities,
        init_options = {
          settings = {
            pyright = {
              settings = {
                pyright = {
                  disableOrganizeImports = true, -- Using Ruff
                },
                python = {
                  analysis = {
                    ignore = { "*" }, -- Using Ruff
                  },
                },
              },
            },
          },
        },
      })
      lspconfig.ruff.setup({
        capabilities = capabilities,
        init_options = {
          settings = {
            args = {
              "--line-length=120",
              "--indent-width=4",
            },
          },
        },
      })
      lspconfig.svelte.setup({
        capabilities = capabilities,
      })
      lspconfig.tailwindcss.setup({
        capabilities = capabilities,
      })
      lspconfig.eslint.setup({
        capabilities = capabilities,
      })
      lspconfig.emmet_language_server.setup({
        filetypes = {
          "css",
          "eruby",
          "htmldjango",
          "html",
          "javascript",
          "javascriptreact",
          "less",
          "sass",
          "scss",
          "pug",
          "typescriptreact",
          "svelte",
        },
        init_options = {
          showAbbreviationSuggestions = true,
          showExpandedAbbreviation = "always",
          showSuggestionsAsSnippets = false,
        },
      })
    end,
  },
}
