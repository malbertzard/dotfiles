return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        plugins = { 
            spelling = true
        },
        key_labels = {
            ["<space>"] = "SPC",
            ["<cr>"] = "RET",
            ["<CR>"] = "RET",
            ["<tab>"] = "TAB",
        },
        hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "^:", "^ ", "^call ", "^lua " },
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
            ["<leader>s"] = { name = "+search" },
            ["<leader>u"] = { name = "+ui" },
            ["<leader>B"] = { name = "+builds" },
            ["<leader>q"] = { name = "+quickfix" },
        }
        wk.register(keymaps)

        wk.register({
            ["<leader>"] = {
                ["1"] = { "<cmd>:lua require('harpoon.ui').nav_file(1)<cr>", "Jump to Mark 1" },
                ["2"] = { "<cmd>:lua require('harpoon.ui').nav_file(2)<cr>", "Jump to Mark 2" },
                ["3"] = { "<cmd>:lua require('harpoon.ui').nav_file(3)<cr>", "Jump to Mark 3" },
                ["4"] = { "<cmd>:lua require('harpoon.ui').nav_file(4)<cr>", "Jump to Mark 4" },
            }
        })

        wk.register({

            ["<leader>"] = {
                t = {
                    name = "+term",
                    v = { "<cmd>vsplit term://bash<cr>", "vSplit Term" },
                    s = { "<cmd>split term://bash<cr>", "vSplit Term" },
                    t = { "<cmd>tabnew | term<cr>", "vSplit Term" },
                },
                T = {
                    name = "+tests",
                    t = { "<cmd>:TestNearest<cr>", "Test Nearest" },
                    T = { "<cmd>:TestFile<cr>", "Test File" },
                    a = { "<cmd>:TestSuite<cr>", "Test Suite" },
                    l = { "<cmd>:TestLast<cr>", "Test Last" },
                    g = { "<cmd>:TestVisit<cr>", "Test Visit" },
                },
                N = {
                    name = "+notes",
                    t = { "<cmd>:Neorg journal today<cr>", "Today" },
                    T = { "<cmd>:Neorg journal tomorrow<cr>", "Tomorrow" },
                    y = { "<cmd>:Neorg journal yesterday<cr>", "Yesterday" },
                },
                h = {
                    name = "+harpoon",
                    a = { "<cmd>:lua require('harpoon.mark').add_file()<cr>", "Add Mark" },
                    l = { "<cmd>:lua require('harpoon.ui').toggle_quick_menu()<cr>", "List Marks" },
                    n = { "<cmd>:lua require('harpoon.ui').nav_next()<cr>", "Prev Mark" },
                    p = { "<cmd>:lua require('harpoon.ui').nav_prev()<cr>", "Next Mark" },
                    ["1"] = { "<cmd>:lua require('harpoon.ui').nav_file(1)<cr>", "Jump to Mark 1" },
                    ["2"] = { "<cmd>:lua require('harpoon.ui').nav_file(2)<cr>", "Jump to Mark 2" },
                    ["3"] = { "<cmd>:lua require('harpoon.ui').nav_file(3)<cr>", "Jump to Mark 3" },
                    ["4"] = { "<cmd>:lua require('harpoon.ui').nav_file(4)<cr>", "Jump to Mark 4" },
                    ["5"] = { "<cmd>:lua require('harpoon.ui').nav_file(5)<cr>", "Jump to Mark 5" },
                    ["6"] = { "<cmd>:lua require('harpoon.ui').nav_file(6)<cr>", "Jump to Mark 6" },
                    ["7"] = { "<cmd>:lua require('harpoon.ui').nav_file(7)<cr>", "Jump to Mark 7" },
                    ["8"] = { "<cmd>:lua require('harpoon.ui').nav_file(8)<cr>", "Jump to Mark 8" },
                    ["9"] = { "<cmd>:lua require('harpoon.ui').nav_file(9)<cr>", "Jump to Mark 9" },
                },
                Ba = {
                    c = { "<cmd>!php artisan cache:clear<cr>", "Artisan Cache Clear" },
                    name = "+artisan",
                },
                Bc = {
                    name = "+composer",
                    c = { "<cmd>:Composer phpcs<cr>", "phpcs" },
                    f = { "<cmd>:Composer phpcs:fix<cr>", "phpcs-fix" },
                    u = { "<cmd>:Composer update<cr>", "update" },
                    i = { "<cmd>:Composer install<cr>", "install" },
                },
            },
        })

    end,
}
