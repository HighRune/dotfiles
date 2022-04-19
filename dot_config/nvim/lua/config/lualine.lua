local fn = vim.fn
local api = vim.api

return function()
	local lualine = require("lualine")

-- stylua: ignore
local colors = {
  bg       = 'none',
  fg       = '#ffffff',
  darkblue = '#24304d',
  blue     = '#6f00ff',
  green    = '#00ff6a',
  red      = '#ff0055',
}

	local mode_colors = {
		n = colors.blue,
		i = colors.red,
		V = colors.green,
		c = colors.bg,
		R = colors.bg,
		v = colors.bg,
		[""] = colors.bg,
		no = colors.bg,
		s = colors.bg,
		S = colors.bg,
		[""] = colors.bg,
		ic = colors.bg,
		Rv = colors.bg,
		cv = colors.bg,
		ce = colors.bg,
		r = colors.bg,
		rm = colors.bg,
		["r?"] = colors.bg,
		["!"] = colors.bg,
		t = colors.bg,
	}

	--- @param trunc_width number trunctates component when screen width is less then trunc_width
	--- @param trunc_len number truncates component to trunc_len number of chars
	--- @param hide_width number hides component when window width is smaller then hide_width
	--- @param no_ellipsis boolean whether to disable adding '...' at end after truncation
	--- return function that can format the component accordingly
	local function trunc(trunc_width, trunc_len, hide_width, no_ellipsis)
		return function(str)
			local win_width = fn.winwidth(0)
			if hide_width and win_width < hide_width then
				return ""
			elseif trunc_width and trunc_len and win_width < trunc_width and #str > trunc_len then
				return str:sub(1, trunc_len) .. (no_ellipsis and "" or "...")
			end
			return str
		end
	end

	local conditions = {
		buffer_not_empty = function()
			return fn.empty(fn.expand("%:t")) ~= 1
		end,
		hide_in_width = function()
			return fn.winwidth(0) > 80
		end,
		check_git_workspace = function()
			local filepath = fn.expand("%:p:h")
			local gitdir = fn.finddir(".git", filepath .. ";")
			return gitdir and #gitdir > 0 and #gitdir < #filepath
		end,
	}

	local sectionLeft = {
		-- {
		-- 	function()
		-- 		api.nvim_command("hi! LualineMode guifg=" .. mode_colors[fn.mode()] .. " guibg=" .. colors.bg)
		-- 		if fn.mode() == "n" or fn.mode() == "i" or fn.mode() == "V" then
		-- 			return ""
		-- 		else
		-- 			return "  "
		-- 		end
		-- 	end,
		-- 	color = "LualineMode",
		-- 	padding = { right = 1, left = 0 },
		-- },
		{
			"mode",
			padding = { left = 0, right = 0 },
			fmt = string.lower,
		},
		{
			"diagnostics",
			sources = { "nvim_diagnostic" },
			-- symbols = { error = " ", warn = " ", hint = " ", info = " " },
			symbols = { error = "E", warn = "W", hint = "H", info = "I" },
			-- diagnostics_color = {
			-- 	error = { fg = colors.red },
			-- 	warn = { fg = colors.yellow },
			-- 	info = { fg = colors.cyan },
			-- 	hint = { fg = colors.cyan },
			-- },
		},

		--------------------------- Mid section
		{
			function()
				return "%="
			end,
		},
		{
			"diff",
			-- symbols = { added = " ", modified = " ", removed = " " },
			symbols = { added = "+", modified = "~", removed = "-" },
			-- diff_color = {
			-- 	added = { fg = colors.green },
			-- 	modified = { fg = colors.orange },
			-- 	removed = { fg = colors.red },
			-- },
			cond = conditions.hide_in_width,
		},
		{
			"filetype",
			colored = true, -- Displays filetype icon in color if set to true
			icon_only = true, -- Display only an icon for filetype
			padding = { left = 0, right = 1 },
		},
		{
			"filename",
			cond = conditions.buffer_not_empty,
			padding = { left = 0, right = 0 },
		},
	}

	local sectionRight = {
		{
			"branch",
			icon = "",
			fmt = trunc(120, 60, 60, true),
		},
		{
			"filesize",
			cond = conditions.buffer_not_empty,
			padding = { right = 0, left = 1 },
		},
		{
			"o:encoding",
			cond = conditions.hide_in_width,
			padding = { right = 0, left = 1 },
		},
		{
			"fileformat",
			icons_enabled = false,
			padding = { right = 0, left = 1 },
		},
	}

	local config = {
		options = {
			-- Disable sections and component separators
			component_separators = "",
			section_separators = "",
			globalstatus = true,
			theme = {
				-- We are going to use lualine_c an lualine_x as left and
				-- right section. Both are highlighted by c theme .  So we
				-- are just setting default looks o statusline
				normal = { c = { fg = colors.fg, bg = colors.bg } },
				inactive = { c = { fg = colors.fg, bg = colors.bg } },
			},
		},
		sections = {
			-- These are to remove the defaults
			lualine_a = {},
			lualine_b = {},
			lualine_y = {},
			lualine_z = {},
			-- These will be filled later
			lualine_c = sectionLeft,
			lualine_x = sectionRight,
		},
		inactive_sections = {
			-- These are to remove the defaults
			lualine_a = {},
			lualine_b = {},
			lualine_c = {},
			lualine_x = {},
			lualine_y = {},
			lualine_z = {},
		},
	}

	-- Now don't forget to initialize lualine
	lualine.setup(config)
end
