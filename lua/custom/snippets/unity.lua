local status, ls = pcall(require, "luasnip")

if not status then
  return
end

-- Shorthands --
local snippet = ls.s
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

local function get_filename_no_extension(parent)
  return parent.snippet.env.TM_FILENAME:match("(.+)%..+$")
end

local function get_namespace_from_path()
  local filepath = vim.fn.expand("%:p")
  local relative_path = vim.fn.fnamemodify(filepath, ":.")

  local scripts_pattern = "Scripts[/\\](.+)[/\\][^/\\]+%.cs$"
  local path_after_scripts = relative_path:match(scripts_pattern)

  if path_after_scripts then
    -- Replace path separators with dots and return Game.{folders}
    local namespace_parts = {}
    for part in path_after_scripts:gmatch("[^/\\]+") do
      table.insert(namespace_parts, part)
    end
    return "Game." .. table.concat(namespace_parts, ".")
  end

  -- Fallback to Game if Scripts folder not found
  return "Game"
end

ls.add_snippets(nil, {
  all = {},
  cs = {
    snippet("uclass", {
      t({ "using UnityEngine;", " ", "namespace " }),
      f(function()
        return get_namespace_from_path()
      end),
      t(" { "),
      t({ "", "\tpublic class " }),
      f(function(_, parent)
        return get_filename_no_extension(parent)
      end),
      t({ " : MonoBehaviour {", "\t\t" }),
      i(1),
      t({ "", "\t}", "}" }),
    }),
    snippet("interface", {
      t({ "using System;", " ", "namespace " }),
      f(function()
        return get_namespace_from_path()
      end),
      t(" { "),
      t({ "", "\tpublic interface " }),
      f(function(_, parent)
        return get_filename_no_extension(parent)
      end),
      t({ " {", "\t\t" }),
      i(1),
      t({ "", "\t}", "}" }),
    }),
    snippet("ecssystem", {
      t({ "using Unity.Burst;", "using Unity.Entities;", " ", "namespace " }),
      f(function()
        return get_namespace_from_path()
      end),
      t(" { "),
      t({ "", "\t\t[BurstCompile]" }),
      t({ "", "\t\tpublic partial struct " }),
      f(function(_, parent)
        return get_filename_no_extension(parent)
      end),
      t(" : ISystem {"),
      t({ "", "\t\t}", "}" }),
    }),
    snippet("ecsdatacomp", {
      t({ "using Unity.Entities;", " ", "namespace " }),
      f(function()
        return get_namespace_from_path()
      end),
      t(" { "),
      t({ "", "\t\tpublic struct " }),
      f(function(_, parent)
        return get_filename_no_extension(parent)
      end),
      t(" : IComponentData {"),
      t({ "", "\t\t}", "}" }),
    }),
  },
})
