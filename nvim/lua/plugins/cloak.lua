return {
  {
    "laytan/cloak.nvim",
    opts = {
      enabled = true,
      cloak_character = "*",
      patterns = {
        {
          file_pattern = { ".env", ".env.*", "*.env" },
          cloak_pattern = "=.+",
        },
      },
    },
  },
}
