local M = {
    "vim-test/vim-test",
    event = "InsertEnter",
    opt = {

    }
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
