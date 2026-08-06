local config_path = vim.fn.stdpath("config")
local lua_path = config_path .. "/lua/"

local group = vim.api.nvim_create_augroup("SebasConfigReload", {
  clear = true,
})

local function notify_success(message)
  vim.notify(message, vim.log.levels.INFO, {
    title = "Neovim Config",
  })
end

local function notify_error(message)
  vim.notify(message, vim.log.levels.ERROR, {
    title = "Neovim Config",
  })
end

local function module_from_file(file)
  return file:gsub(vim.pesc(lua_path), ""):gsub("%.lua$", ""):gsub("/init$", ""):gsub("/", ".")
end

local function clear_sebas_modules()
  for module, _ in pairs(package.loaded) do
    if module:match("^sebasruiz") then
      package.loaded[module] = nil
    end
  end
end

local function execute_plugin_config(module)
  package.loaded[module] = nil

  local ok, spec = pcall(require, module)

  if not ok then
    return false, spec
  end

  if type(spec) ~= "table" then
    return false, module .. " no devolvió una spec válida de Lazy"
  end

  if type(spec.config) == "function" then
    local config_ok, config_err = pcall(spec.config, spec, spec.opts)

    if not config_ok then
      return false, config_err
    end

    return true
  end

  local executed = false

  for _, plugin in ipairs(spec) do
    if type(plugin) == "table" and type(plugin.config) == "function" then
      local config_ok, config_err = pcall(plugin.config, plugin, plugin.opts)

      if not config_ok then
        return false, config_err
      end

      executed = true
    end
  end

  return true, executed
end

local function reload_lualine()
  local module = "sebasruiz.plugins.ui.lualine"

  local ok, err = execute_plugin_config(module)

  if not ok then
    notify_error("Error recargando Lualine:\n" .. tostring(err))
    return false
  end

  pcall(vim.cmd, "redrawstatus")
  pcall(vim.cmd, "redrawtabline")
  pcall(vim.cmd, "redraw")

  return true
end

local function reload_single_module(file)
  local module = module_from_file(file)

  package.loaded[module] = nil

  local ok, err = pcall(require, module)

  if not ok then
    notify_error("Error recargando " .. module .. ":\n" .. tostring(err))
    return
  end

  notify_success("󰑓 Recargado: " .. module)
end

local function reload_plugin_spec(file)
  local module = module_from_file(file)

  local ok, err = execute_plugin_config(module)

  if not ok then
    notify_error("Error recargando " .. module .. ":\n" .. tostring(err))
    return
  end

  if module == "sebasruiz.plugins.start.base46" then
    vim.schedule(function()
      reload_lualine()
      notify_success("󰑓 Colorscheme y Lualine recargados")
    end)

    return
  end

  notify_success("󰑓 Plugin recargado: " .. module)
end

local function reload_full_config()
  clear_sebas_modules()

  local ok, err = pcall(dofile, config_path .. "/init.lua")

  if not ok then
    notify_error("Error recargando la configuración:\n" .. tostring(err))
    return
  end

  notify_success("󰑓 Configuración completa recargada")
end

vim.api.nvim_create_autocmd("BufWritePost", {
  group = group,

  pattern = {
    config_path .. "/init.lua",
    config_path .. "/lua/sebasruiz/**/*.lua",
    config_path .. "/after/plugin/*.lua",
    config_path .. "/after/settings/*.lua",
  },

  callback = function(event)
    local file = vim.fn.fnamemodify(event.file, ":p")

    if file:find("/after/", 1, true) then
      local ok, err = pcall(dofile, file)

      if not ok then
        notify_error("Error recargando " .. file .. ":\n" .. tostring(err))
        return
      end

      notify_success("󰑓 Recargado: " .. vim.fn.fnamemodify(file, ":~:."))

      return
    end

    if file:find("/lua/sebasruiz/plugins/", 1, true) then
      reload_plugin_spec(file)
      return
    end

    if
      file == config_path .. "/init.lua"
      or file:match("/sebasruiz/config/init%.lua$")
      or file:match("/sebasruiz/config/lazy%.lua$")
    then
      reload_full_config()
      return
    end

    reload_single_module(file)
  end,
})
