local lualine = require 'lualine'

function init()
  lualine.setup({
    options = {
      theme = 'tokyonight',
      component_separators = '',
      section_separators = { left = '', right = '' },
    },
    sections = {
      lualine_a = { { 'mode', separator = { left = '' }, right_padding = 2 } },
      lualine_b = { 'filename', 'branch' },
      lualine_c = {
        '%=', --[[ add your center compoentnts here in place of this comment ]]
      },
      lualine_x = {},
      lualine_y = { 'filetype', 'progress' },
      lualine_z = {
        { 'location', separator = { right = '' }, left_padding = 2 },
      },
    },
    inactive_sections = {
      lualine_a = { 'filename' },
      lualine_b = {},
      lualine_c = {},
      lualine_x = {
        {
          require("noice").api.statusline.mode.get,
          cond = require("noice").api.statusline.mode.has,
          color = { fg = "#ff9e64" },
        },
        {
          require("noice").api.status.command.get,
          cond = require("noice").api.status.command.has,
          color = { fg = "#ff9e64" },
        },
      },
      lualine_y = {},
      lualine_z = { 'location' },
    },
    tabline = {},
    extensions = {},
  })
end

return {
  init = init
}
