return {
    "stevearc/oil.nvim",

    opts = {},

    dependencies = { { "echasnovski/mini.icons", opts = {} } },

    lazy = false,

    config = function()
        require("oil").setup({
            default_file_explorer = true, -- Set oil.nvim as the default file explorer.

            columns = {
                "icon",
                -- "permissions",
                -- "size",
                -- "mtime",
            },

            view_options = {
                show_hidden = true,
            },
        })

        -- Map <leader>m o to open oil.nvim
        vim.keymap.set(
            "n",
            "<leader>mo",
            require("oil").open,
            { desc = "Open oil.nvim file explorer", noremap = true, silent = true }
        )
    end,
}
