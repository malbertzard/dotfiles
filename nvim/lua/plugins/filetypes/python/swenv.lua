return {
    "AckslD/swenv.nvim",
    ft = "python",
    enabled = false,
    opts = {
        function ()
            require('swenv').setup(opts)
        end
    }
}
