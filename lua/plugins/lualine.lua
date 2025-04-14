return {
  {
    "nvim-lualine/lualine.nvim",
    requires = { "nvim-tree/nvim-web-devicons", opt = true },
    config = function()
      require("lualine").setup({
        options = {
          icons_enabled = true,
          theme = "lackluster",
        },
        sections = {
          lualine_c = {
            { "filename", path = 1 },
          },
        },
      })
    end,
  },
}
