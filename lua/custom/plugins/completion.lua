return {
  {
    "saghen/blink.cmp",
    dependencies = {
      "rafamadriz/friendly-snippets",
      "onsails/lspkind.nvim",
    },
    version = "1.*",
    lazy = false,
    opts = {
      keymap = {
        preset = "none",
        ["<CR>"] = { "accept", "fallback" },
        ["<C-y>"] = { "accept", "fallback" },
        ["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
        ["<C-e>"] = { "hide", "fallback" },
        ["<C-n>"] = { "select_next", "fallback" },
        ["<C-p>"] = { "select_prev", "fallback" },
        ["<Tab>"] = {
          function(cmp)
            if cmp.snippet_active() then
              return cmp.snippet_forward()
            end
            -- Return false to continue to next command/fallback
            return false
          end,
          "fallback",
        },

        ["<S-Tab>"] = {
          function(cmp)
            if cmp.snippet_active() then
              return cmp.snippet_backward()
            end
            -- Return false to continue to next command/fallback
            return false
          end,
          "fallback",
        },
      },
      completion = {
        accept = {
          auto_brackets = { enabled = true },
        },
        list = {
          selection = { preselect = true, auto_insert = true },
        },
        menu = {
          draw = {
            components = {
              kind_icon = {
                ellipsis = false,
                text = function(ctx)
                  local lspkind = require("lspkind")
                  return lspkind.symbolic(ctx.kind, { mode = "symbol" }) .. ctx.icon_gap
                end,
                highlight = function(ctx)
                  return "BlinkCmpKind" .. ctx.kind
                end,
              },
            },
            columns = {
              { "kind_icon" },
              { "label", "label_description", gap = 1 },
              { "source_name" },
            },
          },
        },
      },

      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
        providers = {
          lsp = {
            name = "LSP",
            module = "blink.cmp.sources.lsp",
          },
          path = {
            name = "path",
            module = "blink.cmp.sources.path",
            score_offset = 3,
            opts = {
              get_cwd = function()
                return vim.fn.getcwd()
              end,
            },
          },
          snippets = {
            name = "snip",
            module = "blink.cmp.sources.snippets",
            score_offset = -1,
          },
          buffer = {
            name = "buf",
            module = "blink.cmp.sources.buffer",
            min_keyword_length = 5,
          },
        },
      },
      signature = { enabled = true },
    },
  },
}
