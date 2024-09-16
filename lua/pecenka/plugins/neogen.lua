return {
    "danymat/neogen",
    version = "*",
    config = true,
    keys = {
        {
            "<leader>nf",
            function()
                require("neogen").generate({
                    type = "func",
                })
            end,
            desc = "function annotations",
        },
        {
            "<leader>nF",
            function()
                require("neogen").generate({
                    type = "file",
                })
            end,
            desc = "file annotations",
        },
        {
            "<leader>nc",
            function()
                require("neogen").generate({
                    type = "class",
                })
            end,
            desc = "class annotations",
        },
        {
            "<leader>nt",
            function()
                require("neogen").generate({
                    type = "type",
                })
            end,
            desc = "type annotations",
        },
        {
            "]n",
            function()
                require("neogen").jump(true)
            end,
            desc = "jump to next annotation",
        },
        {
            "[n",
            function()
                require("neogen").jump(false)
            end,
            desc = "jump to previous annotation",
        },
    },
}
