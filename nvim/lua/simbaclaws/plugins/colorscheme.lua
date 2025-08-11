return {
    "sly-harvey/radium.nvim",             --- Radium Colorscheme
    lazy = false,
    priority = 1000,
    config = function()
      -- Load the colorscheme
      vim.cmd('colorscheme radium')
    end,
}
