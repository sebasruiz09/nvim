-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "C:\\Users\\Betenlace\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\share\\lua\\5.1\\?.lua;C:\\Users\\Betenlace\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\share\\lua\\5.1\\?\\init.lua;C:\\Users\\Betenlace\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\lib\\luarocks\\rocks-5.1\\?.lua;C:\\Users\\Betenlace\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\lib\\luarocks\\rocks-5.1\\?\\init.lua"
local install_cpath_pattern = "C:\\Users\\Betenlace\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\lib\\lua\\5.1\\?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ale = {
    commands = { "ALEEnable" },
    config = { "vim.cmd[[ALEEnable]]" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "C:\\Users\\Betenlace\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\ale",
    url = "https://github.com/w0rp/ale"
  },
  amora = {
    loaded = true,
    path = "C:\\Users\\Betenlace\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\amora",
    url = "https://github.com/owozsh/amora"
  },
  ["dracula.nvim"] = {
    loaded = true,
    path = "C:\\Users\\Betenlace\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\dracula.nvim",
    url = "https://github.com/Mofiqul/dracula.nvim"
  },
  ["everblush.vim"] = {
    loaded = true,
    path = "C:\\Users\\Betenlace\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\everblush.vim",
    url = "https://github.com/mangeshrex/everblush.vim"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "C:\\Users\\Betenlace\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["markdown-preview.nvim"] = {
    commands = { "MarkdownPreview" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "C:\\Users\\Betenlace\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\markdown-preview.nvim",
    url = "https://github.com/iamcco/markdown-preview.nvim"
  },
  ["neo-tree.nvim"] = {
    loaded = true,
    path = "C:\\Users\\Betenlace\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\neo-tree.nvim",
    url = "https://github.com/nvim-neo-tree/neo-tree.nvim"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "C:\\Users\\Betenlace\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "C:\\Users\\Betenlace\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "C:\\Users\\Betenlace\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  ["oceanic-next"] = {
    loaded = true,
    path = "C:\\Users\\Betenlace\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\oceanic-next",
    url = "https://github.com/mhartington/oceanic-next"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "C:\\Users\\Betenlace\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "C:\\Users\\Betenlace\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "C:\\Users\\Betenlace\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "C:\\Users\\Betenlace\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["toggleterm.nvim"] = {
    config = { "\27LJ\2\n8\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\15toggleterm\frequire\0" },
    loaded = true,
    path = "C:\\Users\\Betenlace\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\toggleterm.nvim",
    url = "https://github.com/akinsho/toggleterm.nvim"
  },
  ["vim-atom-dark"] = {
    loaded = true,
    path = "C:\\Users\\Betenlace\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-atom-dark",
    url = "https://github.com/gosukiwi/vim-atom-dark"
  },
  ["vim-aurora"] = {
    loaded = true,
    path = "C:\\Users\\Betenlace\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-aurora",
    url = "https://github.com/rafalbromirski/vim-aurora"
  },
  ["vim-devicons"] = {
    loaded = true,
    path = "C:\\Users\\Betenlace\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-devicons",
    url = "https://github.com/ryanoasis/vim-devicons"
  },
  ["vim-dispatch"] = {
    commands = { "Dispatch", "Make", "Focus", "Start" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "C:\\Users\\Betenlace\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\vim-dispatch",
    url = "https://github.com/tpope/vim-dispatch"
  },
  ["vim-matchup"] = {
    after_files = { "C:\\Users\\Betenlace\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\vim-matchup\\after\\plugin\\matchit.vim" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "C:\\Users\\Betenlace\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\vim-matchup",
    url = "https://github.com/andymass/vim-matchup"
  },
  ["vim-prettier"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "C:\\Users\\Betenlace\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\vim-prettier",
    url = "https://github.com/prettier/vim-prettier"
  },
  ["vim-snazzy"] = {
    loaded = true,
    path = "C:\\Users\\Betenlace\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-snazzy",
    url = "https://github.com/connorholyday/vim-snazzy"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: toggleterm.nvim
time([[Config for toggleterm.nvim]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\15toggleterm\frequire\0", "config", "toggleterm.nvim")
time([[Config for toggleterm.nvim]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file MarkdownPreview lua require("packer.load")({'markdown-preview.nvim'}, { cmd = "MarkdownPreview", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Dispatch lua require("packer.load")({'vim-dispatch'}, { cmd = "Dispatch", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Make lua require("packer.load")({'vim-dispatch'}, { cmd = "Make", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file ALEEnable lua require("packer.load")({'ale'}, { cmd = "ALEEnable", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Start lua require("packer.load")({'vim-dispatch'}, { cmd = "Start", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Focus lua require("packer.load")({'vim-dispatch'}, { cmd = "Focus", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType vim ++once lua require("packer.load")({'ale'}, { ft = "vim" }, _G.packer_plugins)]]
vim.cmd [[au FileType sh ++once lua require("packer.load")({'ale'}, { ft = "sh" }, _G.packer_plugins)]]
vim.cmd [[au FileType zsh ++once lua require("packer.load")({'ale'}, { ft = "zsh" }, _G.packer_plugins)]]
vim.cmd [[au FileType bash ++once lua require("packer.load")({'ale'}, { ft = "bash" }, _G.packer_plugins)]]
vim.cmd [[au FileType cpp ++once lua require("packer.load")({'ale'}, { ft = "cpp" }, _G.packer_plugins)]]
vim.cmd [[au FileType cmake ++once lua require("packer.load")({'ale'}, { ft = "cmake" }, _G.packer_plugins)]]
vim.cmd [[au FileType racket ++once lua require("packer.load")({'ale'}, { ft = "racket" }, _G.packer_plugins)]]
vim.cmd [[au FileType txt ++once lua require("packer.load")({'ale'}, { ft = "txt" }, _G.packer_plugins)]]
vim.cmd [[au FileType javascript ++once lua require("packer.load")({'vim-prettier'}, { ft = "javascript" }, _G.packer_plugins)]]
vim.cmd [[au FileType typescript ++once lua require("packer.load")({'vim-prettier'}, { ft = "typescript" }, _G.packer_plugins)]]
vim.cmd [[au FileType css ++once lua require("packer.load")({'vim-prettier'}, { ft = "css" }, _G.packer_plugins)]]
vim.cmd [[au FileType less ++once lua require("packer.load")({'vim-prettier'}, { ft = "less" }, _G.packer_plugins)]]
vim.cmd [[au FileType scss ++once lua require("packer.load")({'vim-prettier'}, { ft = "scss" }, _G.packer_plugins)]]
vim.cmd [[au FileType graphql ++once lua require("packer.load")({'vim-prettier'}, { ft = "graphql" }, _G.packer_plugins)]]
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'ale', 'vim-prettier'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType vue ++once lua require("packer.load")({'vim-prettier'}, { ft = "vue" }, _G.packer_plugins)]]
vim.cmd [[au FileType html ++once lua require("packer.load")({'ale', 'vim-prettier'}, { ft = "html" }, _G.packer_plugins)]]
vim.cmd [[au FileType md ++once lua require("packer.load")({'ale'}, { ft = "md" }, _G.packer_plugins)]]
vim.cmd [[au FileType c ++once lua require("packer.load")({'ale'}, { ft = "c" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'vim-matchup'}, { event = "VimEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: C:\Users\Betenlace\AppData\Local\nvim-data\site\pack\packer\opt\vim-prettier\ftdetect\css.vim]], true)
vim.cmd [[source C:\Users\Betenlace\AppData\Local\nvim-data\site\pack\packer\opt\vim-prettier\ftdetect\css.vim]]
time([[Sourcing ftdetect script at: C:\Users\Betenlace\AppData\Local\nvim-data\site\pack\packer\opt\vim-prettier\ftdetect\css.vim]], false)
time([[Sourcing ftdetect script at: C:\Users\Betenlace\AppData\Local\nvim-data\site\pack\packer\opt\vim-prettier\ftdetect\graphql.vim]], true)
vim.cmd [[source C:\Users\Betenlace\AppData\Local\nvim-data\site\pack\packer\opt\vim-prettier\ftdetect\graphql.vim]]
time([[Sourcing ftdetect script at: C:\Users\Betenlace\AppData\Local\nvim-data\site\pack\packer\opt\vim-prettier\ftdetect\graphql.vim]], false)
time([[Sourcing ftdetect script at: C:\Users\Betenlace\AppData\Local\nvim-data\site\pack\packer\opt\vim-prettier\ftdetect\html.vim]], true)
vim.cmd [[source C:\Users\Betenlace\AppData\Local\nvim-data\site\pack\packer\opt\vim-prettier\ftdetect\html.vim]]
time([[Sourcing ftdetect script at: C:\Users\Betenlace\AppData\Local\nvim-data\site\pack\packer\opt\vim-prettier\ftdetect\html.vim]], false)
time([[Sourcing ftdetect script at: C:\Users\Betenlace\AppData\Local\nvim-data\site\pack\packer\opt\vim-prettier\ftdetect\javascript.vim]], true)
vim.cmd [[source C:\Users\Betenlace\AppData\Local\nvim-data\site\pack\packer\opt\vim-prettier\ftdetect\javascript.vim]]
time([[Sourcing ftdetect script at: C:\Users\Betenlace\AppData\Local\nvim-data\site\pack\packer\opt\vim-prettier\ftdetect\javascript.vim]], false)
time([[Sourcing ftdetect script at: C:\Users\Betenlace\AppData\Local\nvim-data\site\pack\packer\opt\vim-prettier\ftdetect\json.vim]], true)
vim.cmd [[source C:\Users\Betenlace\AppData\Local\nvim-data\site\pack\packer\opt\vim-prettier\ftdetect\json.vim]]
time([[Sourcing ftdetect script at: C:\Users\Betenlace\AppData\Local\nvim-data\site\pack\packer\opt\vim-prettier\ftdetect\json.vim]], false)
time([[Sourcing ftdetect script at: C:\Users\Betenlace\AppData\Local\nvim-data\site\pack\packer\opt\vim-prettier\ftdetect\less.vim]], true)
vim.cmd [[source C:\Users\Betenlace\AppData\Local\nvim-data\site\pack\packer\opt\vim-prettier\ftdetect\less.vim]]
time([[Sourcing ftdetect script at: C:\Users\Betenlace\AppData\Local\nvim-data\site\pack\packer\opt\vim-prettier\ftdetect\less.vim]], false)
time([[Sourcing ftdetect script at: C:\Users\Betenlace\AppData\Local\nvim-data\site\pack\packer\opt\vim-prettier\ftdetect\lua.vim]], true)
vim.cmd [[source C:\Users\Betenlace\AppData\Local\nvim-data\site\pack\packer\opt\vim-prettier\ftdetect\lua.vim]]
time([[Sourcing ftdetect script at: C:\Users\Betenlace\AppData\Local\nvim-data\site\pack\packer\opt\vim-prettier\ftdetect\lua.vim]], false)
time([[Sourcing ftdetect script at: C:\Users\Betenlace\AppData\Local\nvim-data\site\pack\packer\opt\vim-prettier\ftdetect\markdown.vim]], true)
vim.cmd [[source C:\Users\Betenlace\AppData\Local\nvim-data\site\pack\packer\opt\vim-prettier\ftdetect\markdown.vim]]
time([[Sourcing ftdetect script at: C:\Users\Betenlace\AppData\Local\nvim-data\site\pack\packer\opt\vim-prettier\ftdetect\markdown.vim]], false)
time([[Sourcing ftdetect script at: C:\Users\Betenlace\AppData\Local\nvim-data\site\pack\packer\opt\vim-prettier\ftdetect\php.vim]], true)
vim.cmd [[source C:\Users\Betenlace\AppData\Local\nvim-data\site\pack\packer\opt\vim-prettier\ftdetect\php.vim]]
time([[Sourcing ftdetect script at: C:\Users\Betenlace\AppData\Local\nvim-data\site\pack\packer\opt\vim-prettier\ftdetect\php.vim]], false)
time([[Sourcing ftdetect script at: C:\Users\Betenlace\AppData\Local\nvim-data\site\pack\packer\opt\vim-prettier\ftdetect\ruby.vim]], true)
vim.cmd [[source C:\Users\Betenlace\AppData\Local\nvim-data\site\pack\packer\opt\vim-prettier\ftdetect\ruby.vim]]
time([[Sourcing ftdetect script at: C:\Users\Betenlace\AppData\Local\nvim-data\site\pack\packer\opt\vim-prettier\ftdetect\ruby.vim]], false)
time([[Sourcing ftdetect script at: C:\Users\Betenlace\AppData\Local\nvim-data\site\pack\packer\opt\vim-prettier\ftdetect\scss.vim]], true)
vim.cmd [[source C:\Users\Betenlace\AppData\Local\nvim-data\site\pack\packer\opt\vim-prettier\ftdetect\scss.vim]]
time([[Sourcing ftdetect script at: C:\Users\Betenlace\AppData\Local\nvim-data\site\pack\packer\opt\vim-prettier\ftdetect\scss.vim]], false)
time([[Sourcing ftdetect script at: C:\Users\Betenlace\AppData\Local\nvim-data\site\pack\packer\opt\vim-prettier\ftdetect\svelte.vim]], true)
vim.cmd [[source C:\Users\Betenlace\AppData\Local\nvim-data\site\pack\packer\opt\vim-prettier\ftdetect\svelte.vim]]
time([[Sourcing ftdetect script at: C:\Users\Betenlace\AppData\Local\nvim-data\site\pack\packer\opt\vim-prettier\ftdetect\svelte.vim]], false)
time([[Sourcing ftdetect script at: C:\Users\Betenlace\AppData\Local\nvim-data\site\pack\packer\opt\vim-prettier\ftdetect\typescript.vim]], true)
vim.cmd [[source C:\Users\Betenlace\AppData\Local\nvim-data\site\pack\packer\opt\vim-prettier\ftdetect\typescript.vim]]
time([[Sourcing ftdetect script at: C:\Users\Betenlace\AppData\Local\nvim-data\site\pack\packer\opt\vim-prettier\ftdetect\typescript.vim]], false)
time([[Sourcing ftdetect script at: C:\Users\Betenlace\AppData\Local\nvim-data\site\pack\packer\opt\vim-prettier\ftdetect\vue.vim]], true)
vim.cmd [[source C:\Users\Betenlace\AppData\Local\nvim-data\site\pack\packer\opt\vim-prettier\ftdetect\vue.vim]]
time([[Sourcing ftdetect script at: C:\Users\Betenlace\AppData\Local\nvim-data\site\pack\packer\opt\vim-prettier\ftdetect\vue.vim]], false)
time([[Sourcing ftdetect script at: C:\Users\Betenlace\AppData\Local\nvim-data\site\pack\packer\opt\vim-prettier\ftdetect\xml.vim]], true)
vim.cmd [[source C:\Users\Betenlace\AppData\Local\nvim-data\site\pack\packer\opt\vim-prettier\ftdetect\xml.vim]]
time([[Sourcing ftdetect script at: C:\Users\Betenlace\AppData\Local\nvim-data\site\pack\packer\opt\vim-prettier\ftdetect\xml.vim]], false)
time([[Sourcing ftdetect script at: C:\Users\Betenlace\AppData\Local\nvim-data\site\pack\packer\opt\vim-prettier\ftdetect\yaml.vim]], true)
vim.cmd [[source C:\Users\Betenlace\AppData\Local\nvim-data\site\pack\packer\opt\vim-prettier\ftdetect\yaml.vim]]
time([[Sourcing ftdetect script at: C:\Users\Betenlace\AppData\Local\nvim-data\site\pack\packer\opt\vim-prettier\ftdetect\yaml.vim]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
