local dap, dapui, dappy = require("dap"), require("dapui"), require("dap-python")

--dap python
dappy.setup("python")
table.insert(require('dap').configurations.python, {
  type = 'python',
  request = 'launch',
  name = 'My custom launch configuration',
  program = '${file}',
  console = "internalConsole"
})
dappy.test_runners = "pytest"
vim.keymap.set("n", "<leader>dn", "<cmd>lua require('dap-python').test_method()<CR>")
vim.keymap.set("n", "<leader>df", "<cmd>lua require('dap-python').test_class()<CR>")
vim.keymap.set("n", "<leader>ds", "<ESC><cmd>lua require('dap-python').debug_selection()<CR>")
--dap ui
dapui.setup()
dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end

--require("dap-python").setup(mason_path .. "packages/debugpy/venv/bin/python")

vim.keymap.set("n", "<leader>db", function ()
    dapui.toggle()
end)
vim.keymap.set("n", "<leader>de",'<cmd>lua require("dapui").eval()<CR>', {desc = "evalute an expression in debug mode"})
vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, {desc = "toggle breakpoint for debuging"})
vim.keymap.set("n", "<leader>gb", dap.run_to_cursor, {desc = "run to cursor in debug mode"})

--maybe change from f keys
vim.keymap.set("n", "<F1>", dap.continue, {desc = "debug: continue"})
vim.keymap.set("n", "<F2>", dap.step_into, {desc = "debug: step_into"})
vim.keymap.set("n", "<F3>", dap.step_over, {desc = "debug: step_over"})
vim.keymap.set("n", "<F4>", dap.step_out, {desc = "debug: step_out"})
vim.keymap.set("n", "<F5>", dap.step_back, {desc = "debug: step_back"})
vim.keymap.set("n", "<F12>", dap.restart, {desc = "debug: restart"})
--vim.keymap.set("n", "<F6>", dapui.play, {desc = "debug: run"})
--neo test
require("neotest").setup({
  adapters = {
    require("neotest-python"),
    require("neotest-plenary"),
  }
})
vim.keymap.set("n", "<leader>dt", "<cmd>lua require('neotest').run.run()<CR>", {desc = "run tests"})
