-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

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

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/dulguuncodes/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?.lua;/home/dulguuncodes/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?/init.lua;/home/dulguuncodes/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?.lua;/home/dulguuncodes/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/dulguuncodes/.cache/nvim/packer_hererocks/2.0.5/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
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
  ["barbar.nvim"] = {
    loaded = true,
    path = "/home/dulguuncodes/.local/share/nvim/site/pack/packer/start/barbar.nvim"
  },
  ["coc.nvim"] = {
    loaded = true,
    path = "/home/dulguuncodes/.local/share/nvim/site/pack/packer/start/coc.nvim"
  },
  ["dashboard-nvim"] = {
    commands = { "Dashboard", "DashboardNewFile", "DashboardJumpMarks", "SessionLoad", "SessionSave" },
    loaded = false,
    needs_bufread = false,
    path = "/home/dulguuncodes/.local/share/nvim/site/pack/packer/opt/dashboard-nvim"
  },
  everforest = {
    loaded = true,
    path = "/home/dulguuncodes/.local/share/nvim/site/pack/packer/start/everforest"
  },
  ["galaxyline.nvim"] = {
    loaded = true,
    path = "/home/dulguuncodes/.local/share/nvim/site/pack/packer/start/galaxyline.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\1\0026\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/home/dulguuncodes/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "/home/dulguuncodes/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim"
  },
  ["nvim-comment"] = {
    config = { "\27LJ\1\2'\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\fcomment\frequire\0" },
    loaded = true,
    path = "/home/dulguuncodes/.local/share/nvim/site/pack/packer/start/nvim-comment"
  },
  ["nvim-tree.lua"] = {
    commands = { "NvimTreeToggle" },
    loaded = false,
    needs_bufread = false,
    path = "/home/dulguuncodes/.local/share/nvim/site/pack/packer/opt/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\1\2*\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\15treesitter\frequire\0" },
    loaded = true,
    path = "/home/dulguuncodes/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/dulguuncodes/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/dulguuncodes/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/dulguuncodes/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/dulguuncodes/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/dulguuncodes/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/dulguuncodes/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-gitgutter"] = {
    loaded = true,
    path = "/home/dulguuncodes/.local/share/nvim/site/pack/packer/start/vim-gitgutter"
  },
  ["vim-hexokinase"] = {
    loaded = true,
    path = "/home/dulguuncodes/.local/share/nvim/site/pack/packer/start/vim-hexokinase"
  },
  ["vim-windowswap"] = {
    loaded = true,
    path = "/home/dulguuncodes/.local/share/nvim/site/pack/packer/start/vim-windowswap"
  },
  ["vim-workspace"] = {
    commands = { "ToggleWorkspace", "ToggleAutosave" },
    loaded = false,
    needs_bufread = false,
    path = "/home/dulguuncodes/.local/share/nvim/site/pack/packer/opt/vim-workspace"
  }
}

time([[Defining packer_plugins]], false)
-- Setup for: dashboard-nvim
time([[Setup for dashboard-nvim]], true)
try_loadstring("\27LJ\1\2)\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\14dashboard\frequire\0", "setup", "dashboard-nvim")
time([[Setup for dashboard-nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\1\2*\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\15treesitter\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\1\0026\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: nvim-comment
time([[Config for nvim-comment]], true)
try_loadstring("\27LJ\1\2'\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\fcomment\frequire\0", "config", "nvim-comment")
time([[Config for nvim-comment]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
if vim.fn.exists(":DashboardNewFile") ~= 2 then
vim.cmd [[command! -nargs=* -range -bang -complete=file DashboardNewFile lua require("packer.load")({'dashboard-nvim'}, { cmd = "DashboardNewFile", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
end
if vim.fn.exists(":ToggleAutosave") ~= 2 then
vim.cmd [[command! -nargs=* -range -bang -complete=file ToggleAutosave lua require("packer.load")({'vim-workspace'}, { cmd = "ToggleAutosave", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
end
if vim.fn.exists(":Dashboard") ~= 2 then
vim.cmd [[command! -nargs=* -range -bang -complete=file Dashboard lua require("packer.load")({'dashboard-nvim'}, { cmd = "Dashboard", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
end
if vim.fn.exists(":SessionSave") ~= 2 then
vim.cmd [[command! -nargs=* -range -bang -complete=file SessionSave lua require("packer.load")({'dashboard-nvim'}, { cmd = "SessionSave", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
end
if vim.fn.exists(":ToggleWorkspace") ~= 2 then
vim.cmd [[command! -nargs=* -range -bang -complete=file ToggleWorkspace lua require("packer.load")({'vim-workspace'}, { cmd = "ToggleWorkspace", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
end
if vim.fn.exists(":NvimTreeToggle") ~= 2 then
vim.cmd [[command! -nargs=* -range -bang -complete=file NvimTreeToggle lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
end
if vim.fn.exists(":SessionLoad") ~= 2 then
vim.cmd [[command! -nargs=* -range -bang -complete=file SessionLoad lua require("packer.load")({'dashboard-nvim'}, { cmd = "SessionLoad", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
end
if vim.fn.exists(":DashboardJumpMarks") ~= 2 then
vim.cmd [[command! -nargs=* -range -bang -complete=file DashboardJumpMarks lua require("packer.load")({'dashboard-nvim'}, { cmd = "DashboardJumpMarks", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
end
time([[Defining lazy-load commands]], false)

if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
