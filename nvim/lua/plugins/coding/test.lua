local M = {
    "vim-test/vim-test",
    enabled = true,
    event = "InsertEnter",
}
vim.api.nvim_exec(
    [[
        " Test config
        let test#strategy = "neovim"
        let test#neovim#term_position = "vert"
        let g:test#preserve_screen = 1
    ]],
    false
)


return M
