return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "go" })
      end
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "gopls" })
      end
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, opts)
      table.insert(opts.sources, require("null-ls.builtins.code_actions.gomodifytags"))
      table.insert(opts.sources, require("null-ls.builtins.code_actions.impl"))
      table.insert(opts.sources, require("null-ls.builtins.formatting.gofumpt"))
      table.insert(
        opts.sources,
        require("null-ls.builtins.formatting.goimports_reviser").with({
          generator_opts = { args = { "-project-name", "gitlabdev.vadesecure.com", "$FILENAME" } },
        })
      )
    end,
  },
}
