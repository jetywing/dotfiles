return {
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	opts = { map_cr = false },
	config = function()
		local npairs = require("nvim-autopairs")

		-- Set up nvim-autopairs with a custom rule
		npairs.setup({
			check_ts = true, -- Enable treesitter integration
		})

		-- Add a custom rule for HTML tags
		local Rule = require("nvim-autopairs.rule")
		local cond = require("nvim-autopairs.conds")

		npairs.add_rules({
			Rule("<", ">", "html")
				:with_pair(cond.not_filetypes({ "", "lua", "python", "javascript", "typescript" })) -- Disable in non-html files
				:with_pair(cond.is_end_line()), -- Only close if at the end of the line
		})
	end,
}
