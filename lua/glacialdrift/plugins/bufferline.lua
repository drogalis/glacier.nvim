local M = {}

function M.setup()
	local enabled = require("glacialdrift.colors").config.colors.plugins.bufferline

	if not enabled then
		return
	end

	local colors = require("glacialdrift.colors").config.colors
	local bufferline_highlight_groups = {
		BufferLineFill = { bg = colors.bg, fg = colors.fg },
		BufferLineBackground = { bg = colors.bg, fg = colors.fg },
		BufferLineBufferVisible = { bg = colors.bg, fg = colors.fg },
		BufferLineBufferSelected = { bg = colors.bg, fg = colors.bufferline_selection, gui = "bold" },
		BufferLineTab = { bg = colors.bg, fg = colors.fg },
		BufferLineTabSelected = { bg = colors.bg, fg = colors.bg },
		BufferLineTabClose = { bg = colors.bg, fg = colors.fg },
		BufferLineSeparator = { bg = colors.bg, fg = colors.line_nr },
		BufferLineSeparatorSelected = { bg = colors.bg, fg = colors.bufferline_selection },
		BufferLineIndicatorSelected = { bg = colors.bg, fg = colors.bufferline_selection },
	}

	-- Apply Bufferline highlight groups
	for group_name, config in pairs(bufferline_highlight_groups) do
		local cmd = "highlight " .. group_name
		if config.fg then
			cmd = cmd .. " guifg=" .. config.fg
		end
		if config.bg then
			cmd = cmd .. " guibg=" .. config.bg
		end
		if config.gui then
			cmd = cmd .. " gui=" .. config.gui
		end
		vim.cmd(cmd)
	end
end

return M