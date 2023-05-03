return {
    "windwp/nvim-spectre",
    keys = {
        { "<leader>cR", function() require("spectre").open() end, desc = "Replace in files (Spectre)" },
    },
}
