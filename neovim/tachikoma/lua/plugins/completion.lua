return {
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = false

      local cmp = require("cmp")
      opts.preselect = cmp.PreselectMode.None
      opts.completion = {
        completeopt = "noselect",
        completionItem = { snippetSupport = false },
      }
      opts.mapping = cmp.mapping.preset.insert({
        ["<Down>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
        ["<Up>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
        ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
        ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
        ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
        ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
        ["<C-e>"] = cmp.mapping({
          i = cmp.mapping.abort(),
          c = cmp.mapping.close(),
        }),
        -- Enter only completes for explicitly selected items
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
      })
      opts.sources = cmp.config.sources({
        { name = "luasnip" },
        { name = "nvim_lsp_signature_help" },
        { name = "nvim_lsp" },
        { name = "crates" },
        { name = "buffer", keyword_length = 3, max_item_count = 10 },
        { name = "path" },
      })
    end,
  },
  { "garymjr/nvim-snippets", enabled = false },
  { "rafamadriz/friendly-snippets", enabled = false },
}
