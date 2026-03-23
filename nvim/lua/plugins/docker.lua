return {
  {
    "folke/snacks.nvim",
    keys = {
      {
        "<leader>dD",
        function()
          Snacks.terminal("lazydocker", {
            esc_esc = false,
            title = " lazydocker",
            win = { style = "terminal" },
          })
        end,
        desc = "Lazydocker",
      },
    },
  },
}
