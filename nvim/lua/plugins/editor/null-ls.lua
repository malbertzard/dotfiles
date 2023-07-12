local M = {
    "jose-elias-alvarez/null-ls.nvim",
    event = "BufReadPre",
    enabled = true,
    opts = function()
        local null_ls = require("null-ls")
        local formatting = null_ls.builtins.formatting
        local diagnostics = null_ls.builtins.diagnostics
        local code_actions = null_ls.builtins.code_actions
        local completion = null_ls.builtins.completion
        return {
            sources = {
                formatting.stylua,
                formatting.phpcsfixer,
            },
        }
    end,
}

return M
