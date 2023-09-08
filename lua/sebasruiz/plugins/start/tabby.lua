return {
	'nanozuki/tabby.nvim',
	dependencies = { 'kyazdani42/nvim-web-devicons' },
	config = function()
		require('tabby').setup()
		local theme = {
			fill = { 'TabLineFill', style = "italic" },
			head = 'TabLine',
			current_tab = 'TabLineSel',
			tab = 'TabLine',
			win = 'TabLine',
			tail = 'TabLine',
		}
		require('tabby.tabline').set(function(line)
			return {
				{
					{ '  ', hl = theme.head },
					line.sep('', theme.head, theme.fill),
				},
				line.tabs().foreach(function(tab)
					local hl = tab.is_current() and theme.current_tab or theme.tab
					return {
						line.sep('', hl, theme.fill),
						tab.number(),
						tab.is_current() and '' or '󰆣',
						line.sep('', hl, theme.fill),
						hl = hl,
						margin = ' ',
					}
				end),
				line.spacer(),
				line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
					return {
						line.sep('', theme.win, theme.fill),
						win.is_current() and '' or '',
						win.file_icon(),
						line.sep('', theme.win, theme.fill),
						hl = theme.win,
						margin = ' ',
					}
				end),
				{
					line.sep('', theme.tail, theme.fill),
					{ ' sᴇʙᴀs-ᴘc ', hl = theme.tail },
				},
				hl = theme.fill,
			}
		end)
	end
}
