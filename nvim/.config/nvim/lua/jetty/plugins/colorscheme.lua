return {
	{
		"rebelot/kanagawa.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("kanagawa").setup({
				transparent = true,
				colors = {
					theme = {
						all = {
							ui = {
								bg_gutter = "none",
							},
						},
					},
				},
				overrides = function(colors)
					local theme = colors.theme
					return {
						NormalFloat = { fg = "none", bg = "none" },
						FloatBorder = { fg = "none", bg = "none" },
						FloatTitle = { fg = "none", bg = "none" },

						-- Save an hlgroup with dark background and dimmed foreground
						-- so that you can use it where your still want darker windows.
						-- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
						NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

						-- Popular plugins that open floats will link to NormalFloat by default;
						-- set their background accordingly if you wish to keep them dark and borderless
						LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
						MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },

						-- Telescope
						-- TelescopeTitle = { bg = "none", bold = true },
						-- TelescopePromptNormal = { bg = "none" },
						-- TelescopePromptBorder = { fg = "none", bg = "none" },
						-- TelescopeResultsNormal = { fg = "none", bg = "none" },
						-- TelescopeResultsBorder = { fg = "none", bg = "none" },
						-- TelescopePreviewNormal = { fg = "none", bg = "none" },
						-- TelescopePreviewBorder = { fg = "none", bg = "none" },
					}
				end,
			})
		end,
	},
	{
		"craftzdog/solarized-osaka.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme solarized-osaka]])
		end,
	},
	{
		"folke/tokyonight.nvim",
	},
	{ "rose-pine/neovim", name = "rose-pine" },
	{ "shaunsingh/oxocarbon.nvim" },
	{
		"EdenEast/nightfox.nvim",
	},
	{
		"sam4llis/nvim-tundra",
	},
}
