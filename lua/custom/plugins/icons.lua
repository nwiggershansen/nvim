return {
  "echasnovski/mini.icons",
  opts = {
    extension = {
      csproj = { glyph = "󰪮", hl = "MiniIconsPurple" },
      asset = { glyph = "󰆧", hl = "MiniIconsCyan" },
      asmdef = { glyph = "󰈙", hl = "MiniIconsWhite" },
      lock = { glyph = "󰌾", hl = "MiniIconsYellow" },
    },
  },
  init = function()
    require("mini.icons").mock_nvim_web_devicons()
  end,
}
