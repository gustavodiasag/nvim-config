return {
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
    },
    config = function()
      -- Nvim tree keymaps.
      vim.keymap.set("n", "<leader>t", ":NvimTreeFindFileToggle<CR>", {})
      vim.keymap.set("n", "<leader>H", ":NvimTreeResize -5<CR>", {})
      vim.keymap.set("n", "<leader>L", ":NvimTreeResize +5<CR>", {})

      require("nvim-tree").setup({
        filters = {
          dotfiles = true,
        },
        git = {
          enable = false,
        },
        view = {
          relativenumber = true,
          number = true,
          width = 32,
        },
      })
    end,
  },
}
