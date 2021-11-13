local g = vim.g

-------------------- inside/vim-search-pulse
local function searchPulse()
	g.vim_search_pulse_mode = "pattern"
	g.vim_search_pulse_duration = 200
end

return { searchPulse = searchPulse }
