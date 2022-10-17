local status_ok, tabline = pcall(require, "tabline")
if not status_ok then
    return
end

tabline.setup({
    enable = true,
    options = {
        show_tabs_only = false,
    }
})
