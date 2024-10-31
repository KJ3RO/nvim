local tokyonight = require('tokyonight')
local lualine = require('lualine')
local noice = require('noice')
local notify = require('notify')

local function init()
  tokyonight.setup({
    style = "night",
    transparent = true,
  })

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
          noice.api.statusline.mode.get,
          cond = noice.api.statusline.mode.has,
          color = { fg = "#ff9e64" },
        },
        {
          noice.api.status.command.get,
          cond = noice.api.status.command.has,
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
