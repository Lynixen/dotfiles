-- plugins/tabnine.lua
return {
  {
    'codota/tabnine-nvim',
    build = "./dl_binaries.sh",
    config = function()
      require('tabnine').setup({
        disable_auto_comment = true,
        accept_keymap = "<Tab>",
        dismiss_keymap = "<C-]>",
        debounce_ms = 800,
        suggestion_color = { gui = "#808080", cterm = 244 },
        exclude_filetypes = { "TelescopePrompt", "NvimTree" },
        log_file_path = nil, -- Set this to an absolute path if you want to log Tabnine activity
        ignore_certificate_errors = false,
      })
    end,
    lazy = false,  -- Set to true if you want to lazy-load this plugin
  }
}
