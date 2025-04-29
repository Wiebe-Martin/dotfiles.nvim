-- colorshemes/neomodern.lua
-- Using lazy.nvim
return {
	"cdmill/neomodern.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("neomodern").setup({
			-- MAIN OPTIONS --
			-- Choose between 'iceclimber', 'coffeecat', 'darkforest', 'roseprime', 'daylight'
			theme = "roseprime",
			-- Keymap (in normal mode) to toggle between themes in theme list
			cycle_theme_key = nil,
			cycle_theme_list = { "iceclimber", "coffeecat", "darkforest", "roseprime" },
			-- Keymap (in normal mode) to toggle between light and dark mode.
			-- Recommended to remove `daylight` from `toggle_theme_list` if you are also using
			-- `cycle_theme_key` keymap for a more intuitive cycle behavior
			toggle_mode_key = nil,
			-- Don't set background
			transparent = true,
			-- If true, enable the terminal
			term_colors = true,
			-- If true, docstrings will be highlighted like strings, otherwise they will be highlighted
			-- like comments. Note, behavior is depending on the language server.
			colored_docstrings = true,
			-- If false, brackets will be highlighted similar to the default fg color
			colored_brackets = true,
			-- Don't set background of floating windows. Recommended for when using floating windows
			-- with borders.
			plain_float = false,
			-- Show the end-of-buffer tildes
			show_eob = true,
			-- If true, highlights {sign,fold}column the same as cursorline
			cursorline_gutter = true,
			diagnostics = {
				darker = true, -- Darker colors for diagnostic
				undercurl = true, -- Use undercurl for diagnostics
				background = true, -- Use background color for virtual text
			},

			-- CODE FORMATTING --
			-- The following table accepts values the same as the `gui` option for normal
			-- highlights. For example, `bold`, `italic`, `underline`, `none`.
			code_style = {
				comments = "italic",
				conditionals = "none",
				functions = "none",
				keywords = "none",
				-- Markdown headings
				headings = "bold",
				operators = "none",
				keyword_return = "none",
				strings = "none",
				variables = "none",
			},

			-- PLUGINS --
			-- The following options allow for more control over some plugin appearances.
			plugin = {
				lualine = {
					-- Bold lualine_a sections
					bold = true,
					-- Don't set section/component backgrounds. Recommended to not set
					-- section/component separators.
					plain = false,
				},
				cmp = {
					-- Don't highlight lsp-kind items. Only the current selection will be highlighted.
					plain = false,
					-- Reverse lsp-kind items' highlights in cmp menu.
					reverse = false,
				},
				-- Options are 'borderless' or 'bordered'.
				telescope = "bordered",
			},

			-- CUSTOM HIGHLIGHTS --
			-- Override default colors
			colors = {},
			-- Override highlight groups
			highlights = {},
		})
		-- Convenience function that simply calls `:colorscheme <theme>` with the theme
		-- specified in your config. If not specified, `iceclimber` is used.
		require("neomodern").load()
	end,
}
