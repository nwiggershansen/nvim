local status, ls = pcall(require, "luasnip")

if not status then
  return
end

require("luasnip.loaders.from_vscode").lazy_load()

ls.config.set_config({
  history = true,
  updateevents = "TextChanged, TextChangedI",
  enable_auto_snippets = true,
})
