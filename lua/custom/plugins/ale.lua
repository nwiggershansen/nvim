return {
  {
    'dense-analysis/ale',
    config = function()
      vim.g.ale_linters = {
        cs = { 'OmniSharp' },
        sh = { 'language_server' }
      }

      vim.g.ale_sign_error = '•'
      vim.g.ale_sign_warning = '•'
      vim.g.ale_sign_info = '·'
      vim.g.ale_sign_style_error = '·'
      vim.g.ale_sign_style_warning = '·'
    end,
  },
}
