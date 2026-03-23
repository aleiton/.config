return {
  {
    "amitds1997/remote-nvim.nvim",
    version = "*",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("remote-nvim").setup()

      -- Override RemoteStart to inject a working_dir for specific hosts
      -- Populate via local.lua: vim.g.remote_working_dirs = { ["host"] = "/path" }
      local working_dirs = vim.g.remote_working_dirs or {}

      vim.api.nvim_create_user_command("RemoteStart", function(opts)
        local remote_nvim = require("remote-nvim")
        local devpod_utils = require("remote-nvim.providers.devpod.devpod_utils")
        local host_identifier = vim.trim(opts.args)

        if host_identifier == "" then
          require("telescope").extensions["remote-nvim"].connect()
          return
        end

        local workspace_config =
          remote_nvim.session_provider:get_config_provider():get_workspace_config(vim.trim(host_identifier))
        if vim.tbl_isempty(workspace_config) then
          vim.notify("Unknown host identifier. Run :RemoteStart to connect to a new host", vim.log.levels.ERROR)
          return
        end

        local devpod_opts = devpod_utils.get_workspace_devpod_opts(workspace_config)
        if working_dirs[host_identifier] then
          devpod_opts.working_dir = working_dirs[host_identifier]
        end

        remote_nvim.session_provider
          :get_or_initialize_session({
            host = workspace_config.host,
            provider_type = workspace_config.provider,
            conn_opts = { workspace_config.connection_options },
            unique_host_id = host_identifier,
            devpod_opts = devpod_opts,
          })
          :launch_neovim()
      end, {
        nargs = "?",
        desc = "Start Neovim on remote machine",
        complete = function(_, line)
          local remote_nvim = require("remote-nvim")
          local args = vim.split(vim.trim(line), "%s+")
          table.remove(args, 1)
          local valid_hosts =
            vim.tbl_keys(remote_nvim.session_provider:get_config_provider():get_workspace_config())
          if #args == 0 then
            return valid_hosts
          end
          return vim.fn.matchfuzzy(valid_hosts, args[1])
        end,
      })
    end,
  },
}
