
return {
	{
		'echasnovski/mini.map',
		event = 'BufReadPost', -- Changed event to 'BufReadPost' to load minimap after the buffer is read
		keys = {
			{ '<Leader>mn', '<cmd>lua MiniMap.toggle()<CR>', desc = 'Mini map' },
		},
		opts = function()
			local minimap = require('mini.map')
			return {
				integrations = {
					minimap.gen_integration.diagnostic(),
					minimap.gen_integration.builtin_search(),
					minimap.gen_integration.gitsigns(),
				},
				symbols = {
					scroll_line = '⎕',
					scroll_view = '┊',
				},
				show_integration_count = false,
				window = {
					width = 10, -- Reduced width to minimize interference with coding
					winblend = 60, -- Increased transparency to make it less distracting
					position = 'right', -- Positioned on the right to avoid blocking code
					autoclose = true, -- Automatically close the minimap when not in use
				},
			}
		end,
		config = function(_, opts)
			local minimap = require('mini.map')
			minimap.setup(opts)
		end,
	},
}

