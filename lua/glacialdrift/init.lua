local M = {}

M.setup = function(user_config)
	require("glacialdrift.colors").extend(user_config or {})
end

M.load = function(user_config)
	local config = require("glacialdrift.colors").config
	if user_config then
		vim.tbl_deep_extend("force", config, user_config)
	end

	-- we only need to run this if another theme is already set
	-- otherwise, assume it's a clean slate
	if vim.g.colors_name then
		vim.cmd("highlight clear")
	end

	vim.g.colors_name = "glacialdrift"
	vim.o.termguicolors = true

	-- for colorscheme
	require("glacialdrift.colors").setup(config)
	-- for config
	require("glacialdrift.config").setup(config)
end

return M