local function init()
  require('doyeon.lazy').init()
  require('doyeon.options').init()
  require('doyeon.keymaps').init()
  require('doyeon.telescope').init()
  require('doyeon.lualine').init()
end

return {
  init = init,
}
