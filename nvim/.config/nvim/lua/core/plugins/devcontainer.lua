local M = {
    "esensar/nvim-dev-container",
    config = function()
        require("devcontainer").setup {}
    end,
}

return M
