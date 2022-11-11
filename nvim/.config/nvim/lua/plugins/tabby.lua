local status_ok, tabby = pcall(require, "tabby")
if not status_ok then
	return
end

local theme = {
    fill = 'TabLineFill',
    head = 'TabLine',
    current_tab = 'TabLineSel',
    tab = 'TabLineFill',
    win = 'TabLine',
    tail = 'TabLine',
}
require('tabby.tabline').set(function(line)
    return {
        {
            { '  ', hl = theme.fill }
        },
        line.spacer(),
        line.tabs().foreach(function(tab)
            local hl = tab.is_current() and theme.current_tab or theme.current_tab
            return {
                line.sep('', theme.current_tab, theme.tab),
                tab.is_current() and '' or '',
                tab.number(),
                tab.name(),
                line.sep('', theme.current_tab, theme.tab),
                hl = hl,
                margin = ' ',
            }
        end),
        hl = theme.head,
    }
end)
