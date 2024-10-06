local conf = require("telescope.config").values
local arr = {}
arr[vim.cmd(":f")] =  vim.api.nvim_buf_get_name(0)
print(arr["MYPLUG.lua"])
vim.keymap.set("n", "<leader>fp", function ()
    --vim.cmd("new")
    --"o{<cmd>vimvim.api.nvim_buf_get_name(0)}<Esc>"
    require("telescope.pickers").new({},{
        prompt_title = "Previous Files",
        finder = require("telescope.finders").new_table({
            results = arr
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.file.generic_sorter({}),
    }):find()
end)

   -- require("telescope.pickers").new({}, {
     --   prompt_title = "Harpoon",
       -- finder = require("telescope.finders").new_table({
         --   results = file_paths,
  --      }),
    --    previewer = conf.file_previewer({}),
     --   sorter = conf.generic_sorter({}),
    --}):find()
vim.keymap.set("n", "<leader>fl", "o<cmd>vimvim.api.nvim_buf_get_name(0)<Esc>")
--"oif err != nil {<CR>}<Esc>Oreturn err<Esc>"}
