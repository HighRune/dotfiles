local fn = vim.fn
local api = vim.api

local function setup()
	local lualine = require("lualine")

-- stylua: ignore
local colors = {
  bg       = 'none',
  fg       = '#ffffff',
  cyan     = '#004d6b',
  darkblue = '#24304d',
  blue     = '#3a486b',
  magenta  = '#7733ff',
  green    = '#2bffa3',
  red      = '#ff2696',
}

	local mode_colors = {
		n = colors.darkblue,
		i = colors.green,
		R = colors.red,
		V = colors.magenta,
		c = colors.fg,
		v = colors.darkblue,
		[""] = colors.darkblue,
		no = colors.darkblue,
		s = colors.darkblue,
		S = colors.darkblue,
		[""] = colors.darkblue,
		ic = colors.darkblue,
		Rv = colors.darkblue,
		cv = colors.darkblue,
		ce = colors.darkblue,
		r = colors.darkblue,
		rm = colors.darkblue,
		["r?"] = colors.darkblue,
		["!"] = colors.darkblue,
		t = colors.darkblue,
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

				if fn.mode() == "n" then
					return "  "
				elseif fn.mode() == "c" then
					return " "
				else
					return ""
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
			-- Is it me or the symbol for modified us really weird
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
			padding = { right = 2, left = 1 },
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
			-- these are to remove the defaults
			lualine_a = {},
			lualine_b = {},
			lualine_y = {},
			lualine_z = {},
			-- These will be filled later
			lualine_c = sectionLeft,
			lualine_x = sectionRight,
		},
		inactive_sections = {
			-- these are to remove the defaults
			lualine_a = {},
			lualine_v = {},
			lualine_y = {},
			lualine_z = {},
			lualine_c = {},
			lualine_x = {},
		},
	}

	--------------------------- Add components to left sections

	--------------------------- Add components to right sections

	-- Now don't forget to initialize lualine
	lualine.setup(config)
end

return { setup = setup }
