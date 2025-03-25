local blink = require("blink.cmp")

blink.setup({
  sources = {
    providers = {
      luasnip = {
        name = "luasnip",
        enabled = true,
        module = "blink.cmp.sources.luasnip",
        score_offset = 950,
      },
    },
    default = { "lsp", "path", "snippets", "buffer" },
  },

  cmdline = {
    enabled = false,
  },

  keymap = {
    preset = "enter",
    ["<C-y>"] = { "select_and_accept" },
  },

  fuzzy = { implementation = "lua" },
})
