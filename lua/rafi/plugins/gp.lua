return {
	'robitx/gp.nvim',
	config = function()
		require('gp').setup({
			providers = {
				openai = {
					secret = 'SK-999999999999999999999',
				},
			},
		})
	end,
	-- Remove any lazy-loading conditions to ensure immediate loading
	lazy = false,
}
