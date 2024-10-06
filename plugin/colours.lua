function ColourMyPencils(colour)
	colour = colour or 'rose-pine' -- rose-pine and gruvbox
	vim.cmd.colorscheme(colour)
	vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
	vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
	vim.api.nvim_set_hl(0, 'NormalNC', { bg = 'none' })
	vim.api.nvim_set_hl(0, 'NormalSB', { bg = 'none' })
end
ColourMyPencils()
