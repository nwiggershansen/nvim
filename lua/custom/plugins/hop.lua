return {
  {
    "smoka7/hop.nvim",
    config = function()
      local hop = require("hop")
      local directions = require("hop.hint").HintDirection

      hop.setup({ keys = "etovxqpdygfblzhckisuran", case_insensitive = false })

      vim.keymap.set("", "f", function()
        hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
      end, { remap = true })
      vim.keymap.set("", "F", function()
        hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
      end, { remap = true })
      vim.keymap.set("", "t", function()
        hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
      end, { remap = true })
      vim.keymap.set("", "T", function()
        hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
      end, { remap = true })

      vim.api.nvim_set_keymap("n", "s", "<cmd>HopChar2<CR>", { silent = true })
      vim.api.nvim_set_keymap("n", "S", "<cmd>HopWord<CR>", { silent = true })
      vim.api.nvim_set_keymap("n", "<leader>ls", "<cmd>HopLine<CR>", { silent = true })
    end,
  },
}
