local M = {}

local highlight = function(color, opts)
  vim.api.nvim_set_hl(0, color, opts)
end

M.get_hl = function(name)
  return vim.api.nvim_get_hl_by_name(name, {})
end

M.set_hl = function()
  highlight("St_NormalMode", { fg = "#32CD32", bold = true })
  highlight("St_InsertMode", { fg = "#FF7518", bold = true })
  highlight("St_VisualMode", { fg = "#DA70D6", bold = true })
  highlight("St_ReplaceMode", { fg = "#D2042D", bold = true })
  highlight("St_CommandMode", { fg = "#DFFF00", bold = true })
  highlight("St_TerminalMode", { fg = "#F4BB44", bold = true })
  highlight("St_NTerminalMode", { fg = "#93C572", bold = true })
  highlight("St_CurrentFile", { fg = "#00BFFF", bold = true })

  highlight("St_git_add", { fg = "#32CD32" })
  highlight("St_git_change", { fg = "#FF7518" })
  highlight("St_git_delete", { fg = "#D2042D" })

  highlight("Spacer", { bg = M.get_hl("St_NormalMode").background })
  highlight("LspClient", { bg = M.get_hl("St_NormalMode").background })
  highlight("AltSpacer", { bg = "#565f89" })
  highlight("Treesitter", { fg = "#32CD32", bg = "#565f89" })
  highlight("St_cwd_icon", { bg = "#f7768e", fg = "#333333" })
  highlight("St_cwd_text", { bg = "#565f89" })
  highlight("St_cwd_sep", { fg = "#f7768e" })
end

M.modes = {
  ["n"] = { "NORMAL", "St_NormalMode" },
  ["no"] = { "NORMAL (no)", "St_NormalMode" },
  ["nov"] = { "NORMAL (nov)", "St_NormalMode" },
  ["noV"] = { "NORMAL (noV)", "St_NormalMode" },
  ["noCTRL-V"] = { "NORMAL", "St_NormalMode" },
  ["niI"] = { "NORMAL i", "St_NormalMode" },
  ["niR"] = { "NORMAL r", "St_NormalMode" },
  ["niV"] = { "NORMAL v", "St_NormalMode" },
  ["nt"] = { "NTERMINAL", "St_NTerminalMode" },
  ["ntT"] = { "NTERMINAL (ntT)", "St_NTerminalMode" },

  ["v"] = { "VISUAL", "St_VisualMode" },
  ["vs"] = { "V-CHAR (Ctrl O)", "St_VisualMode" },
  ["V"] = { "V-LINE", "St_VisualMode" },
  ["Vs"] = { "V-LINE", "St_VisualMode" },
  [""] = { "V-BLOCK", "St_VisualMode" },

  ["i"] = { "INSERT", "St_InsertMode" },
  ["ic"] = { "INSERT (completion)", "St_InsertMode" },
  ["ix"] = { "INSERT completion", "St_InsertMode" },

  ["t"] = { "TERMINAL", "St_TerminalMode" },

  ["R"] = { "REPLACE", "St_ReplaceMode" },
  ["Rc"] = { "REPLACE (Rc)", "St_ReplaceMode" },
  ["Rx"] = { "REPLACEa (Rx)", "St_ReplaceMode" },
  ["Rv"] = { "V-REPLACE", "St_ReplaceMode" },
  ["Rvc"] = { "V-REPLACE (Rvc)", "St_ReplaceMode" },
  ["Rvx"] = { "V-REPLACE (Rvx)", "St_ReplaceMode" },

  ["s"] = { "SELECT", "St_SelectMode" },
  ["S"] = { "S-LINE", "St_SelectMode" },
  [""] = { "S-BLOCK", "St_SelectMode" },
  ["c"] = { "COMMAND", "St_CommandMode" },
  ["cv"] = { "COMMAND", "St_CommandMode" },
  ["ce"] = { "COMMAND", "St_CommandMode" },
  ["r"] = { "PROMPT", "St_ConfirmMode" },
  ["rm"] = { "MORE", "St_ConfirmMode" },
  ["r?"] = { "CONFIRM", "St_ConfirmMode" },
  ["x"] = { "CONFIRM", "St_ConfirmMode" },
  ["!"] = { "SHELL", "St_TerminalMode" },
}

return M
