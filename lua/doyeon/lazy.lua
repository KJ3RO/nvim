local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        style = "night",
        transparent = true,
      })
    end
  },
  { 
    "catppuccin/nvim", 
    name = "catppuccin", 
    priority = 1000, 
    config = function() 
      require("catppuccin").setup({
        flavour = "mocha",
        transparent_background = true,
        color_overrides = {
          mocha = {
            base = "#11111b",
            mantle = "#11111b",
            crust = "#11111b",
          },
        },
      })
    end 
  },
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  },
  -- lazy.nvim
{
  "folke/noice.nvim",
  event = "VeryLazy",
  config = function()
    require("noice").setup({
    })
  end,
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
    }
  },
})
