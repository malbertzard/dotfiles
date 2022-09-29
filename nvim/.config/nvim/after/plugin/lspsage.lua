local status, saga = pcall(require, "lspsaga")
if (not status) then return end

saga.init_lsp_saga {
    border_style = "rounded",
    code_action_icon = "",
    saga_winblend = 0,
    server_filetype_map = {
        typescript = 'typescript'
    }
}

local opts = { noremap = true, silent = true }
vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)
vim.keymap.set('n', 'gp', '<Cmd>Lspsaga peek_definition<CR>', opts)
vim.keymap.set('n', 'gr', '<Cmd>Lspsaga rename<CR>', opts)
vim.keymap.set('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
vim.keymap.set('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
