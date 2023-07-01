local status, ls = pcall(require, "luasnip")

if not status then
  return
end

-- Shorthands --
local snippet = ls.s
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

ls.config.set_config({
  history = true,
  updateevents = "TextChanged, TextChangedI",
  enable_auto_snippets = true,
})

local get_filename_no_extension = function(parent)
  return parent.snippet.env.TM_FILENAME:match("(.+)%..+$")
end

ls.add_snippets(nil, {
  all = {
  },
  cs = {
    snippet("uclass",
      {
        t({ "using UnityEngine;",
          " ",
          "namespace WeMakeGames." }),
        i(1, "namespace"),
        t(" { "),
        t({ "", "\tpublic class " }),
        f(function(_, parent) return get_filename_no_extension(parent) end),
        t({ " : MonoBehaviour {", "\t\t" }),
        i(2),
        t({ "",
          "\t}",
          "}" }),
      }),
    snippet("interface", {
      t({ "using System;",
        " ",
        "namespace WeMakeGames." }),
      i(1, "namespace"),
      t(" { "),
      t({ "", "\tpublic interface " }),
      f(function(_, parent) return get_filename_no_extension(parent) end),
      t({ " {", "\t\t" }),
      i(2),
      t({ "",
        "\t}",
        "}" }),
    })
  }
})


vim.keymap.set({ "i", "s" }, "<C-k>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-j>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true })
