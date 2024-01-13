local status, ls = pcall(require, "luasnip")

if not status then
  return
end

require("luasnip.loaders.from_vscode").lazy_load()

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
    snippet("uclass", {
      t({ "using UnityEngine;",
        " ",
        "namespace Game." }),
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
        "namespace Game." }),
      i(1, "namespace"),
      t(" { "),
      t({ "", "\tpublic interface " }),
      f(function(_, parent) return get_filename_no_extension(parent) end),
      t({ " {", "\t\t" }),
      i(2),
      t({ "",
        "\t}",
        "}" }),
    }),
    snippet("ecssystem", {
      t({ "using Unity.Burst;",
        "using Unity.Entities;",
        " ",
        "namespace Game." }),
      i(1, "namespace"),
      t(" { "),
      t({ "", "\t\t[BurstCompile]" }),
      t({ "", "\t\tpublic partial struct " }),
      f(function(_, parent) return get_filename_no_extension(parent) end),
      t(" : ISystem {"),
      t({ "",
        "\t\t}",
        "}" }),
    }),
    snippet("ecsdatacomp", {
      t({ "using Unity.Entities;",
        " ",
        "namespace Game." }),
      i(1, "namespace"),
      t(" { "),
      t({ "", "\t\tpublic struct " }),
      f(function(_, parent) return get_filename_no_extension(parent) end),
      t(" : IComponentData {"),
      t({ "",
        "\t\t}",
        "}" }),

    })

  }
})


vim.keymap.set({ "i", "s" }, "<C-k>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<tab>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true })


vim.keymap.set({ "i", "s" }, "<C-j>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true })
