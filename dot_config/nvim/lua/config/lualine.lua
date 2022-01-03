local fn = vim.fn
local api = vim.api

local function setup()
	local lualine = require("lualine")

-- Color table for highlights
-- stylua: ignore
local colors = {
  bg       = 'none',
  fg       = '#ffffff',
  cyan     = '#004d6b',
  darkblue = '#24304d',
  magenta  = '#7733ff',
  blue     = '#94e8ff',
  red      = '#ff2696',
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

	-- Config
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
			lualine_c = {},
			lualine_x = {},
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

	-- Inserts a component in lualine_c at left section
	local function ins_left(component)
		table.insert(config.sections.lualine_c, component)
	end

	-- Inserts a component in lualine_x ot right section
	local function ins_right(component)
		table.insert(config.sections.lualine_x, component)
	end

	--------------------------- Add components to left sections

	ins_left({
		-- mode component
		function()
			-- auto change color according to neovims mode
			local mode_color = {
				n = colors.darkblue,
				i = colors.blue,
				R = colors.red,
				V = colors.magenta,
				c = colors.cyan,
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
			api.nvim_command("hi! LualineMode guifg=" .. mode_color[fn.mode()] .. " guibg=" .. colors.bg)
			return ""
		end,
		color = "LualineMode",
		padding = { right = 1, left = 0 },
	})

	ins_left({
		-- mode component
		"mode",
		padding = { left = 0, right = 1 },
	})

	-- ins_left({ "location" })
	-- ins_left({ "progress", color = { fg = colors.fg, gui = "bold" } })

	ins_left({
		"diagnostics",
		sources = { "nvim_diagnostic" },
		symbols = { error = " ", warn = " ", hint = " ", info = " " },
		-- diagnostics_color = {
		-- 	error = { fg = colors.red },
		-- 	warn = { fg = colors.yellow },
		-- 	info = { fg = colors.cyan },
		-- 	hint = { fg = colors.cyan },
		-- },
	})

	--------------------------- Insert mid section
	-- You can make any number of sections in neovim
	-- for lualine it's any number greater then 2
	ins_left({
		function()
			return "%="
		end,
	})

	ins_left({
		"diff",
		-- Is it me or the symbol for modified us really weird
		symbols = { added = " ", modified = " ", removed = " " },
		-- diff_color = {
		-- 	added = { fg = colors.green },
		-- 	modified = { fg = colors.orange },
		-- 	removed = { fg = colors.red },
		-- },
		cond = conditions.hide_in_width,
	})

	ins_left({
		"branch",
		icon = "",
	})

	--------------------------- Add components to right sections

	ins_right({
		-- filesize component
		"filesize",
		cond = conditions.buffer_not_empty,
		padding = { right = 0, left = 1 },
	})

	ins_right({
		"o:encoding",
		-- fmt = string.upper,
		cond = conditions.hide_in_width,
		padding = { right = 0, left = 1 },
	})

	ins_right({
		"fileformat",
		-- fmt = string.upper,
		icons_enabled = false,
		padding = { right = 0, left = 1 },
	})

	-- Now don't forget to initialize lualine
	lualine.setup(config)
end

return { setup = setup }
