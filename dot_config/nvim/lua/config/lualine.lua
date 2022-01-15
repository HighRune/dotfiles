local fn = vim.fn
local api = vim.api

local function setup()
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
		{
			function()
				api.nvim_command("hi! LualineMode guifg=" .. mode_colors[fn.mode()] .. " guibg=" .. colors.bg)
				if fn.mode() == "n" or fn.mode() == "i" or fn.mode() == "V" then
					return ""
				else
					return "  "
				end
			end,
			color = "LualineMode",
			padding = { right = 1, left = 0 },
		},
		{
			"mode",
			padding = { left = 0, right = 1 },
		},
		{
			"diagnostics",
			sources = { "nvim_diagnostic" },
			symbols = { error = " ", warn = " ", hint = " ", info = " " },
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
			symbols = { added = " ", modified = " ", removed = " " },
			-- diff_color = {
			-- 	added = { fg = colors.green },
			-- 	modified = { fg = colors.orange },
			-- 	removed = { fg = colors.red },
			-- },
			cond = conditions.hide_in_width,
		},
		{
			"branch",
			icon = "",
		},
	}

	local sectionRight = {
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
			padding = { right = 1, left = 1 },
		},
	}

	local config = {
		options = {
			-- Disable sections and component separators
			component_separators = "",
			section_separators = "",
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
			lualine_v = {},
			lualine_y = {},
			lualine_z = {},
			lualine_c = {},
			lualine_x = {},
		},
	}

	-- Now don't forget to initialize lualine
	lualine.setup(config)
end

return { setup = setup }
