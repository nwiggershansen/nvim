local status, ls = pcall(require, "luasnip")
if not status then
  return
end

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
  local scripts_pattern = "scripts[/\\](.+)[/\\][^/\\]+%.cs$"
  local path_after_scripts = relative_path:match(scripts_pattern)
  if path_after_scripts then
    local namespace_parts = {}
    for part in path_after_scripts:gmatch("[^/\\]+") do
      table.insert(namespace_parts, part)
    end
    return "Game." .. table.concat(namespace_parts, ".")
  end
  return "Game"
end

ls.add_snippets(nil, {
  all = {},
  cs = {
    snippet("gduiclass", {
      t({ "using Godot;", "", "namespace " }),
      f(function()
        return get_namespace_from_path()
      end),
      t({ ";", "", "public class " }),
      f(function(_, parent)
        return get_filename_no_extension(parent)
      end),
      t({ " : Canvas {", "\t" }),
      i(1),
      t({ "", "}" }),
    }),

    snippet("gdclass", {
      t({ "using Godot;", "", "namespace " }),
      f(function()
        return get_namespace_from_path()
      end),
      t({ ";", "", "public class " }),
      f(function(_, parent)
        return get_filename_no_extension(parent)
      end),
      t({ " : Node2D {", "\t" }),
      i(1),
      t({ "", "}" }),
    }),

    snippet("interface", {
      t({ "using System;", "", "namespace " }),
      f(function()
        return get_namespace_from_path()
      end),
      t({ " {", "", "\tpublic interface " }),
      f(function(_, parent)
        return get_filename_no_extension(parent)
      end),
      t({ " {", "\t\t" }),
      i(1),
      t({ "", "\t}", "}" }),
    }),

    snippet("gdready", {
      t({ "public override void _Ready() {", "\t" }),
      i(1),
      t({ "", "}" }),
    }),

    snippet("gdexit", {
      t({ "public override void _ExitTree() {", "\t" }),
      i(1),
      t({ "", "}" }),
    }),
  },
})
