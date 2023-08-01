return {
  "williamboman/mason.nvim",
  priority = 1000,
  dependencies = {
    { "williamboman/mason-lspconfig.nvim" },
    { "neovim/nvim-lspconfig" }
  },
  config = function()
    require("mason").setup()

    -- angular-language-server path
    local ngserver = "/home/sebas/.nvm/versions/node/v18.17.0/bin/ngserver"
    local project_library_path = "/home/sebas/.nvm/versions/node/v18.17.0/lib/"
    local cmd = { ngserver, "--stdio", "--tsProbeLocations", project_library_path, "--ngProbeLocations",
      project_library_path }

    require 'lspconfig'.angularls.setup {
      cmd = cmd,
      on_new_config = function(new_config, new_root_dir)
        new_config.cmd = cmd
      end,
    }
    local configs = {
      angularls = {
        cmd = cmd,
        on_new_config = function(new_config, new_root_dir)
          new_config.cmd = cmd
        end
      }
    }
    local startLsp = function(lspname)
      local lspconfig = require 'lspconfig'
      local settings = configs[lspname] or {}
      lspconfig[lspname].setup(settings)
    end

    vim.api.nvim_create_user_command(
      "Runnerlsp",
      function(props)
        startLsp(props.args)
      end,
      {
        nargs = 1,
        complete = function(_, _)
          return require 'mason-lspconfig'.get_installed_servers()
        end
      })
  end
}
