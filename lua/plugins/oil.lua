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
            -- require("oil").open,
            -- function()
            --     require("oil").open_float(".")
            -- end,
            "<cmd>Oil --preview --float <CR>",
            { desc = "Open oil.nvim file explorer", noremap = true, silent = true }
        )

        vim.api.nvim_create_autocmd("User", {
            pattern = "OilActionsPost",
            callback = function(event)
                if event.data.actions.type == "move" then
                    Snacks.rename.on_rename_file(event.data.actions.src_url, event.data.actions.dest_url)
                end
            end,
        })
    end,
}
