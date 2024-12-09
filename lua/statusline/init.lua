local utils = require("statusline.modules")

function Statusline()
  local res = table.concat({
    utils.Mode(),
    utils.Spacer(),
    utils.Git(),
    utils.Spacer(),
    "%=",
    utils.FileInfo(),
    utils.Spacer(),
    "%=",
    utils.LSP_Diagnostics(),
    utils.LSP_status(),
    utils.Spacer(),
    utils.cwd(),
  })

  if utils.Treesitter() ~= "" then
    res = table.concat({
      res,
      utils.AltSpacer(),
      utils.Treesitter(),
      utils.AltSpacer(),
    })
  end

  return res
end

vim.o.statusline = "%!v:lua.Statusline()"
