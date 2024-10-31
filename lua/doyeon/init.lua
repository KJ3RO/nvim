local function init()
  require('doyeon.vim').init()
  require('doyeon.theme').init()
  require('doyeon.telescope').init()
  require('doyeon.lualine').init()
end

return {
  init = init,
}
