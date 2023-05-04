local M = {
	lazy = false,
    "catppuccin/nvim",
	priority = 1000,
	opts = function()
		local colors = require("utils").git_colors
		return {
			style = "mocha",
			on_highlights = function(hl, c)
				hl.GitSignsAdd = {
					fg = colors.GitAdd,
				}
				hl.GitSignsChange = {
					fg = colors.GitChange,
				}
				hl.GitSignsDelete = {
					fg = colors.GitDelete,
				}
			end,
		}
	end,
	config = function(_, opts)
		local colorscheme = require("catppuccin")
		colorscheme.setup(opts)
		colorscheme.load()
	end,
}

return M
