local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED
-- basic telescope configuration
local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
    end

    require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
            results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
    }):find()
    local make_finder = function()
	    local paths = {}
	    for _, item in ipairs(harpoon_files.items) do
		    table.insert(paths, item.value)
	    end

	    return require("telescope.finders").new_table(
	    {
		    results = paths
	    }
	    )
    end

    require("telescope.pickers").new(
    {},
    {
	    prompt_title = "Harpoon",
	    finder = make_finder(),
	    previewer = conf.file_previewer({}),
	    sorter = conf.generic_sorter({}),
	    attach_mappings = function(prompt_buffer_number, map)
		    map(
		    "i",
		    "<C-M-D>", -- your mapping here
		    function()
			    local state = require("telescope.actions.state")
			    local selected_entry = state.get_selected_entry()
			    local current_picker = state.get_current_picker(prompt_buffer_number)

			    harpoon:list():removeAt(selected_entry.index)
			    current_picker:refresh(make_finder())
		    end
		    )

		    return true
	    end
    }
    ):find()
end

vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end,
    { desc = "Open harpoon window" })

vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end, {desc = "add buffer to harpoon"})
--vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<M-1>", function() harpoon:list():select(1) end,{desc = "navigate to harppon tab: 1"})
vim.keymap.set("n", "<M-2>", function() harpoon:list():select(2) end,{desc = "navigate to harppon tab: 2"})
vim.keymap.set("n", "<M-3>", function() harpoon:list():select(3) end,{desc = "navigate to harppon tab: 3"})
vim.keymap.set("n", "<M-4>", function() harpoon:list():select(4) end,{desc = "navigate to harppon tab: 4"})
vim.keymap.set("n", "<M-5>", function() harpoon:list():select(5) end,{desc = "navigate to harppon tab: 5"})

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end, {desc = "jump to previous harpoon tab"})
vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end, {desc = "jump to next harpoon tab"})

vim.keymap.set("n", "<M-9>", function () harpoon:list():clear() end, {desc = "clear all harpoon tabs"})
