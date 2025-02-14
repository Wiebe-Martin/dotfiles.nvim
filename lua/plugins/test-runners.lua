return {
    require("plugins.neotest").setup({
        adapters = {
            require("neotest-python"),
        },
    }),
}
