local status_ok, nvim_colorizer = pcall(require, "colorizer")
if not status_ok then
    return
end

nvim_colorizer.setup {
    filetypes = {
        'css',
        'html',
        'javascript'
    },
    user_default_options = {
        names = false,
        mode = "background",
        tailwind = "lsp",
        virtualtext = "■"
    }
}
