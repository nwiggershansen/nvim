-- Restore cursor to file position in previous editing session
vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function(args)
    local mark = vim.api.nvim_buf_get_mark(args.buf, "\"")
    local line_count = vim.api.nvim_buf_line_count(args.buf)
    if mark[1] > 0 and mark[1] <= line_count then
      vim.cmd("normal! g`\"zz")
    end
  end,
})

-- Highlights the variable usage within the current view, when holding for x ms (based on vim.opt.updatetime)
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if not client or not client:supports_method("textDocument/documentHighlight") then
      return
    end

    local group = vim.api.nvim_create_augroup("lsp-highlight-" .. args.buf, {
      clear = true,
    })

    vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
      group = group,
      buffer = args.buf,
      callback = vim.lsp.buf.document_highlight,
    })

    vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
      group = group,
      buffer = args.buf,
      callback = vim.lsp.buf.clear_references,
    })
  end,
})
