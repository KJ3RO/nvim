local telescope = require('telescope')

local function init()
  telescope.setup {
    defaults = {
      file_ignore_patterns = {
        "node_modules/.*",
      },
      layout_strategy = "flex",
      layout_config = {
        horizontal = {
          prompt_position = "top",
          preview_width = 0.55,
        },
        vertical = { mirror = false },
        width = 0.87,
        height = 0.8,
        preview_cutoff = 120,
      },
    }
  }
end

return {
  init = init,
}
