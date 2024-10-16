return {

	-- Floating statuslines
	{
		'b0o/incline.nvim',
		event = 'FileType',
		config = function()
			local helpers = require('incline.helpers')
			local devicons = require('nvim-web-devicons')
			require('incline').setup({
				hide = {
					cursorline = true, -- Hides the statusline when the cursor is on the same line
				},
				window = {
					padding = 0,
					margin = { horizontal = 0, vertical = 0},
					placement = { vertical = 'bottom', horizontal = 'left' }, -- Position at bottom left
				},
				render = function(props)
					local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':t')
					if filename == '' then
						filename = '[No Name]'
					end
					local ft_icon, ft_color = devicons.get_icon_color(filename)
					local modified = vim.bo[props.buf].modified and '[+]' or ''
					local line_number = vim.api.nvim_win_get_cursor(props.win)[1]
					local filetype = vim.bo[props.buf].filetype

					return {
						ft_icon and { ' ', ft_icon, ' ', guibg = ft_color, guifg = helpers.contrast_color(ft_color) } or '',
						' ',
						{ filename, gui = modified and 'bold,italic' or 'bold' },
						' ',
						modified,
						' ',
						{ 'Ln:', line_number, ' ', 'Ft:', filetype },
					}
				end,
			})
		end,
		opts = {
			ignore = {
				filetypes = { 'gitcommit' },
			},
		},
	},
}


