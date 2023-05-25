local M = {
    "vuki656/package-info.nvim",
    enabled = true,
    keys = {
      { "<leader>up", "<cmd>lua require('package-info').show()<cr>", desc = "Package Info" },
    },
    dependencies = {
        "MunifTanjim/nui.nvim"
    },
    opts = {
        function ()
            require("package-info").setup()
        end
    }
}

return M
