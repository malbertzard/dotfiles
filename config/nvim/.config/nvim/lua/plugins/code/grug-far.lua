return {
    'MagicDuck/grug-far.nvim',
    keys = {
        { "<leader>sr", "<cmd>GrugFar<cr>", desc = "Search Replace" }
    },
    config = function()
        require('grug-far').setup({});
    end
}
