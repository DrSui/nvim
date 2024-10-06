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
vim.keymap.set("n", "<F1>", dap.continue)
vim.keymap.set("n", "<F2>", dap.step_into)
vim.keymap.set("n", "<F3>", dap.step_over)
vim.keymap.set("n", "<F4>", dap.step_out)
vim.keymap.set("n", "<F5>", dap.step_back)
vim.keymap.set("n", "<F12>", dap.restart)

--neo test
require("neotest").setup({
  adapters = {
    require("neotest-python")({
        -- Extra arguments for nvim-dap configuration
        -- See https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for values
        dap = { justMyCode = false },
        -- Command line arguments for runner
        -- Can also be a function to return dynamic values
        args = {"--log-level", "DEBUG"},
        -- Runner to use. Will use pytest if available by default.
        -- Can be a function to return dynamic value.
        runner = ".venv/scirpts/pytest.exe",
        -- Custom python path for the runner.
        -- Can be a string or a list of strings.
        -- Can also be a function to return dynamic value.
        -- If not provided, the path will be inferred by checking for 
        -- virtual envs in the local directory and for Pipenev/Poetry configs
        python = ".venv/scripts/python.exe",
        -- Returns if a given file path is a test file.
        -- NB: This function is called a lot so don't perform any heavy tasks within it.
        -- !!EXPERIMENTAL!! Enable shelling out to `pytest` to discover test
        -- instances for files containing a parametrize mark (default: false)
        pytest_discover_instances = true,
    })
  }
})
vim.keymap.set("n", "<leader>dt", "<cmd>lua require('neotest').run.run()<CR>")
