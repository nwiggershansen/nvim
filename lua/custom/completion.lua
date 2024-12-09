local status, cmp = pcall(require, "cmp")

if not status then
  return
end
local lsp_status, lspkind = pcall(require, "lspkind")

if not lsp_status then
  return
end

cmp.setup({
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    ["<C-y>"] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
    ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
  }),
  formatting = {
    format = lspkind.cmp_format({
      with_text = true,
      mode = "symbol",
      maxwidth = 50,
      ellipsis_char = "...",
      menu = {
        buffer = "[buf]",
        nvim_lsp = "[LSP]",
        path = "[path]",
        luasnip = "[snip]",
      },
    }),
  },
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "nvim_lsp_signature_help" },
    { name = "luasnip", max_item_count = 5 },
    { name = "path", max_item_count = 2 },
    { name = "buffer", keyword_length = 5 },
  }),
})
