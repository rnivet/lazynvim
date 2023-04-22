return {
  {
    "glepnir/lspsaga.nvim",
    event = "LspAttach",
    config = function()
      require("lspsaga").setup({
        finder = {
          keys = {
            vsplit = "<CR>",
          },
        },
        definition = {
          quit = "q",
        },
      })
    end,
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
      --Please make sure you install markdown and markdown_inline parser
      { "nvim-treesitter/nvim-treesitter" },
    },
    keys = {
      { "gf", "<cmd>Lspsaga lsp_finder<CR>" },
      { "gt", "<cmd>Lspsaga peek_type_definition<CR>" },
    },
  },
  -- LSP keymaps
  {
    "neovim/nvim-lspconfig",
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      keys[#keys + 1] = { "gd", "<cmd>Lspsaga peek_definition<CR>" }
    end,
  },
}
