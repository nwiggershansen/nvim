local dap, dapui = require("dap"), require("dapui")
local base_path = vim.fn.stdpath("data") .. "/third-party/"

local home = os.getenv("HOME")
local netcoredbg = ""

if vim.fn.has("mac") == 1 then
elseif vim.fn.has("unix") == 1 then
  netcoredbg = base_path .. "/netcoredbg/netcoredbg"
elseif vim.fn.has("win32") == 1 then
  if home ~= nil then
    netcoredbg = home:gsub("\\", "/") .. "/AppData/Local/nvim-data/third-party/netcoredbg/netcoredbg.exe"
  else
    netcoredbg = base_path .. "/netcoredbg/netcoredbg.exe"
  end
else
  netcoredbg = base_path .. "/netcoredbg/netcoredbg.exe"
end

dap.adapters.coreclr = {
  type = "executable",
  command = netcoredbg,
  args = { "--interpreter=vscode" },
}

dap.configurations.cs = {
  {
    type = "coreclr",
    name = "launch - netcoredbg",
    request = "launch",
    program = function()
      return vim.fn.input("Path to dll", vim.fn.getcwd() .. "/bin/Debug/", "file")
    end,
  },
}

dapui.setup({
  icons = { expanded = "▾", collapsed = "▸", current_frame = "▸" },
  mappings = {
    -- Use a table to apply multiple mappings
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
    toggle = "t",
  },
  element_mappings = {},
  -- Expand lines larger than the window
  -- Requires >= 0.7
  expand_lines = true,
  layouts = {
    {
      elements = {
        { id = "scopes", size = 0.25 },
        "breakpoints",
        "stacks",
        "watches",
      },
      size = 40, -- 40 columns
      position = "left",
    },
    {
      elements = {
        "repl",
        "console",
      },
      size = 0.25, -- 25% of total lines
      position = "bottom",
    },
  },
  controls = {
    enabled = true,
    element = "repl",
    icons = {
      pause = "",
      play = "",
      step_into = "",
      step_over = "",
      step_out = "",
      step_back = "",
      run_last = "↻",
      terminate = "□",
    },
  },
  floating = {
    max_height = nil, -- These can be integers or a float between 0 and 1.
    max_width = nil, -- Floats will be treated as percentage of your screen.
    border = "single", -- Border style. Can be "single", "double" or "rounded"
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  windows = { indent = 1 },
  render = {
    max_type_length = nil, -- Can be integer or nil.
    max_value_lines = 100, -- Can be integer or nil.
  },
})

dap.listeners.after.event_initialized["dapui_config"] = function()
  vim.cmd("NvimTreeClose")
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
  vim.cmd("NvimTreeOpen")
end

vim.keymap.set("n", "<F5>", "<cmd>lua require'dap'.continue()<CR>")
vim.keymap.set("n", "<F10>", "<cmd>lua require'dap'.step_over()<CR>")
vim.keymap.set("n", "<F11>", "<cmd>lua require'dap'.step_into()<CR>")
vim.keymap.set("n", "<F12>", "<cmd>lua require'dap'.step_out()<CR>")
vim.keymap.set("n", "<leader>b", "<cmd>lua require'dap'.toggle_breakpoint()<CR>")
vim.keymap.set("n", "<leader>B", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
vim.keymap.set("n", "<leader>dr", "<cmd>lua require'dap'.repl.open()<CR>")
vim.keymap.set("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<CR>")
