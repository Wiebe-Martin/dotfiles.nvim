return {
    "mfussenegger/nvim-dap",
    recommended = true,
    desc = "Debugging support. Requires language specific adapters to be configured. (see lang extras)",

    dependencies = {
        "rcarriga/nvim-dap-ui",
        -- virtual text for the debugger
        {
            "theHamsta/nvim-dap-virtual-text",
            opts = {},
        },
    },

    -- stylua: ignore
    keys = {
        { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "Breakpoint Condition" },
        { "<leader>db", function() require("dap").toggle_breakpoint() end,                                    desc = "Toggle Breakpoint" },
        { "<leader>dc", function() require("dap").continue() end,                                             desc = "Run/Continue" },
        { "<leader>da", function() require("dap").continue({ before = get_args }) end,                        desc = "Run with Args" },
        { "<leader>dC", function() require("dap").run_to_cursor() end,                                        desc = "Run to Cursor" },
        { "<leader>dg", function() require("dap").goto_() end,                                                desc = "Go to Line (No Execute)" },
        { "<leader>di", function() require("dap").step_into() end,                                            desc = "Step Into" },
        { "<leader>dj", function() require("dap").down() end,                                                 desc = "Down" },
        { "<leader>dk", function() require("dap").up() end,                                                   desc = "Up" },
        { "<leader>dl", function() require("dap").run_last() end,                                             desc = "Run Last" },
        { "<leader>do", function() require("dap").step_out() end,                                             desc = "Step Out" },
        { "<leader>dO", function() require("dap").step_over() end,                                            desc = "Step Over" },
        { "<leader>dP", function() require("dap").pause() end,                                                desc = "Pause" },
        { "<leader>dr", function() require("dap").repl.toggle() end,                                          desc = "Toggle REPL" },
        { "<leader>ds", function() require("dap").session() end,                                              desc = "Session" },
        { "<leader>dt", function() require("dap").terminate() end,                                            desc = "Terminate" },
        { "<leader>dw", function() require("dap.ui.widgets").hover() end,                                     desc = "Widgets" },
    },

    config = function()
        vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })

        local dap = require("dap")

        dap.set_log_level("TRACE")

        dap.adapters.cppdbg = {
            id = "cppdbg",
            type = "executable",
            command = vim.fn.stdpath("data") .. "/mason/packages/cpptools/extension/debugAdapters/bin/OpenDebugAD7",
        }

        dap.adapters.gdb = {
            type = "executable",
            command = "/home/martin/zephyr-sdk-0.18.0-alpha4/gnu/arm-zephyr-eabi/bin/arm-zephyr-eabi-gdb",
            args = { "--eval-command", "set print pretty on" },
        }

        dap.configurations.c = {
            {
                name = "Launch GDB",
                type = "gdb",
                request = "launch",
                program = function()
                    return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
                end,
                cwd = "${workspaceFolder}",
                stopAtBeginningOfMainSubprogram = false,
            },
            {
                name = "Attach to Zephyr gdbserver :1234",
                type = "cppdbg",
                request = "launch",
                MIMode = "gdb",
                miDebuggerServerAddress = "localhost:1234",
                miDebuggerPath = "/home/martin/zephyr-sdk-0.18.0-alpha4/gnu/arm-zephyr-eabi/bin/arm-zephyr-eabi-gdb",
                cwd = "${workspaceFolder}",
                program = "${workspaceFolder}/build/zephyr/zephyr.elf",
                stopAtEntry = true,
                setupCommands = {
                    {
                        text = "-enable-pretty-printing",
                        description = "Enable pretty printing",
                        ignoreFailures = true,
                    },
                    {
                        text = "dir /home/martin/zephyrproject/zephyr",
                        description = "Set source path",
                        ignoreFailures = true,
                    },
                    {
                        text = "set architecture armv7-a",
                        description = "Set correct architecture for Cortex-A9",
                        ignoreFailures = true,
                    },
                },
            },
        }
    end,
}
