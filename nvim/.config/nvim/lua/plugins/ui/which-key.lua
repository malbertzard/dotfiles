-- better indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Better paste
vim.keymap.set("v", "p", '"_dP')

-- Cancel search highlighting with ESC
vim.keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Clear hlsearch and ESC" })

-- Refactoring keybinds
vim.keymap.set("x", "<leader>re", function() require("refactoring").refactor("Extract Function") end,
    { desc = "Extract Function" })
vim.keymap.set("x", "<leader>rf", function() require("refactoring").refactor("Extract Function To File") end,
    { desc = "Extract Function To File" }) -- Extract function supports only visual mode
vim.keymap.set("x", "<leader>rv", function() require("refactoring").refactor("Extract Variable") end,
    { desc = "Extract Variable" })         -- Extract variable supports only visual mode
vim.keymap.set("n", "<leader>rI", function() require("refactoring").refactor("Inline Function") end,
    { desc = "Inline Function" })          -- Inline func supports only normal
vim.keymap.set({ "n", "x" }, "<leader>ri", function() require("refactoring").refactor("Inline Variable") end,
    { desc = "Inline Variable" })          -- Inline var supports both normal and visual mode
vim.keymap.set("n", "<leader>rb", function() require("refactoring").refactor("Extract Block") end,
    { desc = "Extract Block" })
vim.keymap.set("n", "<leader>rbf", function() require("refactoring").refactor("Extract Block To File") end,
    { desc = "Extract Block to File" }) -- Extract block supports only normal mode

-- Quickfix List
vim.keymap.set("n", "<leader>QC",
    function()
        vim.fn.setqflist({})
    end,
    { desc = "Clear Quickfix List" }
)

-- Terminal --
-- Better terminal navigation
vim.keymap.set("t", "<C-h>", "<C-\\><C-N><C-w>h")
vim.keymap.set("t", "<C-j>", "<C-\\><C-N><C-w>j")
vim.keymap.set("t", "<C-k>", "<C-\\><C-N><C-w>k")
vim.keymap.set("t", "<C-l>", "<C-\\><C-N><C-w>l")
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

local utils = require("utils.functions")
local M = {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
        { "<leader>Q",   "",                             desc = "+Quickfix" },
        { "<leader>l",   "",                             desc = "+LSP" },
        { "<leader>e",   "",                             desc = "+Errors" },
        { "<leader>m",   "",                             desc = "+Misc" },
        { "<leader>b",   "",                             desc = "+Buffer" },

        { "<leader>T",   "",                             desc = "+Term" },

        { "<leader>Tn",  "",                             desc = "+Tab" },
        { "<leader>Tnh", "<cmd>tabnew | term htop <cr>", desc = "htop" },
        { "<leader>Tnt", "<cmd>tabnew | term<cr>",       desc = "Tab Term" },

        { "<leader>Ts",  "<cmd>split | term<cr>",        desc = "sSplit Term" },
        { "<leader>Tv",  "<cmd>vsplit | term<cr>",       desc = "vSplit Term" },

        {
            "<c-w><space>",
            function()
                require("which-key").show({ keys = "<c-w>", loop = true })
            end,
            desc = "Window Hydra Mode",
        },

        { "<leader>mf",  "<cmd>Format<cr>",                        desc = "Format" },

        { "<leader>mS",  "",                                       desc = "+Spell" },
        { "<leader>mSN", "]s",                                     desc = "Next Spell" },
        { "<leader>mSP", "[s",                                     desc = "Prev Spell" },
        { "<leader>mSS", function() utils.switch_spell_lang() end, desc = "Switch spell" },
        { "<leader>mSA", "zg",                                     desc = "Add word" },
        { "<leader>mSf", "1z=",                                    desc = "First suggestion" },
        {
            "<leader>mS<space>",
            function()
                require("which-key").show({ keys = "<leader>mS", loop = true })
            end,
            desc = "Spelling Hydra Mode",
        }
    },
}

return M
