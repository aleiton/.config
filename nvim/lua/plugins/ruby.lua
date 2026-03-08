return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        ruby = { "rubocop" },
      },
      format_on_save = {
        timeout_ms = 2000,
        lsp_format = "fallback",
      },
    },
  },
  {
    "sato-s/telescope-rails.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("telescope").load_extension("rails")
    end,
    keys = {
      { "<leader>rc", function()
        require("telescope").extensions.rails.controllers({ initial_mode = "normal" })
      end, desc = "Rails Controllers" },
      { "<leader>rm", function()
        require("telescope").extensions.rails.models({ initial_mode = "normal" })
      end, desc = "Rails Models" },
      { "<leader>rv", function()
        require("telescope").extensions.rails.views({ initial_mode = "normal" })
      end, desc = "Rails Views" },
      { "<leader>rs", function()
        require("telescope").extensions.rails.specs({ initial_mode = "normal" })
      end, desc = "Rails Specs" },
      { "<leader>rd", function()
        require("telescope").extensions.rails.migrations({ initial_mode = "normal" })
      end, desc = "Rails Migrations" },
      { "<leader>rg", function()
        require("telescope").extensions.rails.generators({ initial_mode = "normal" })
      end, desc = "Rails Generators" },
      { "<leader>rp", function()
        require("telescope.builtin").find_files({ search_dirs = { "app/representers" }, prompt_title = "Representers", initial_mode = "normal" })
      end, desc = "Rails Representers" },
      { "<leader>ri", function()
        require("telescope.builtin").find_files({ search_dirs = { "app/api" }, prompt_title = "API", initial_mode = "normal" })
      end, desc = "Rails API" },
      { "<leader>ra", function()
        require("telescope.builtin").find_files({ search_dirs = { "lib/rails_admin", "config/initializers" }, prompt_title = "Rails Admin", initial_mode = "normal" })
      end, desc = "Rails Admin" },
    },
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "olimorris/neotest-rspec",
    },
    opts = function(_, opts)
      opts.adapters = opts.adapters or {}
      table.insert(opts.adapters, require("neotest-rspec"))
    end,
  },
}
