local M = {}

M.setup = function()
	local colors = require("glacialdrift.colors").config.colors

	local enabled = require("glacialdrift.colors").config.colors.plugins.gitsigns

	if not enabled then
		return
	end

	local highlight_groups = {
		GitSignsAdd = { fg = colors.added, bg = "NONE" },
		GitSignsChange = { fg = colors.changed, bg = "NONE" },
		GitSignsDelete = { fg = colors.removed, bg = "NONE" },
	}

	for group_name, config in pairs(highlight_groups) do
		local cmd = "highlight " .. group_name
		if config.fg then
			cmd = cmd .. " guifg=" .. config.fg
		end
		if config.bg then
			cmd = cmd .. " guibg=" .. config.bg
		end
		vim.cmd(cmd)
	end
end

return M