return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        plugins = { spelling = true },
    },
    config = function(_, opts)
        local wk = require("which-key")
        wk.setup(opts)
        local keymaps = {
            mode = { "n", "v" },
            ["g"] = { name = "+goto" },
            ["gz"] = { name = "+surround" },
            ["]"] = { name = "+next" },
            ["["] = { name = "+prev" },
            ["<leader>c"] = { name = "+code" },
            ["<leader>f"] = { name = "+file/find" },
            ["<leader>g"] = { name = "+git" },
            ["<leader>q"] = { name = "+quit/session" },
            ["<leader>s"] = { name = "+search" },
            ["<leader>u"] = { name = "+ui" },
            ["<leader>B"] = { name = "+builds" },
            ["<leader>Ba"] = { name = "+artisan" },
            ["<lnader>T"] = { name = "+tests" },
            ["<leader>x"] = { name = "+quickfix" },
            --
            -- ["<leader>w"] = { name = "+windows" },
            -- ["<leader><tab>"] = { name = "+tabs" },
            -- ["<leader>b"] = { name = "+buffer" },
        }
        wk.register(keymaps)

        wk.register({
            ["<leader>"] = {
                t = {
                    v = { "<cmd>vsplit term://bash<cr>", "vSplit Term" },
                    s = { "<cmd>split term://bash<cr>", "vSplit Term" },
                    t = { "<cmd>tabnew | term<cr>", "vSplit Term" },
                },
                T = {
                    t = { "<cmd>:TestNearest<cr>", "Test Nearest" },
                    T = { "<cmd>:TestFile<cr>", "Test File" },
                    a = { "<cmd>:TestSuite<cr>", "Test Suite" },
                    l = { "<cmd>:TestLast<cr>", "Test Last" },
                    g = { "<cmd>:TestVisit<cr>", "Test Visit" },
                },
                B = {
                    ac = { "<cmd>!php artisan cache:clear<cr>", "Artisan Cache Clear" },
                },
            },
        })

    end,
}
