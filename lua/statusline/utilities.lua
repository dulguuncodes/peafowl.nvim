local colors = require("colors")
local symbols = require("statusline.symbols")

local _OPERATING_SYSTEM = nil
local _REFRESHES = 0

local _capture = function(cmd)
  local f = assert(io.popen(cmd, "r"))
  local s = assert(f:read("*a"))
  f:close()
  s = string.gsub(s, "^%s+", "")
  s = string.gsub(s, "%s+$", "")
  s = string.gsub(s, "[\n\r]+", " ")
  return s
end

local _get_os_icon = function(os)
  if os == "Linux" then
    return symbols.linux_logo
  elseif os == "Darwin" then
    return symbols.darwin_logo
  elseif os == "Windows" then
    return symbols.windows_logo
  else
    return symbols.unknown_logo
  end
end

local M = {}

M.buffer_not_empty = function()
  if vim.fn.empty(vim.fn.expand("%:t")) ~= 1 then
    return true
  end
  return false
end

M.checkwidth = function()
  local squeeze_width = vim.fn.winwidth(0) / 2
  if squeeze_width > 40 then
    return true
  end
  return false
end

M.check_for_git = function()
  if M.buffer_not_empty() and require("galaxyline.condition").check_git_workspace() then
    return colors.blue
  end
  return colors.bg
end

M.buffer_check = function()
  if M.buffer_not_empty() then
    return colors.fg
  end
  return colors.white
end

M.git_patch = function()
  if M.buffer_not_empty() then
    return M.check_for_git()
  end
  return colors.bg
end

M.spacing = function()
  return " "
end

M.get_refreshes = function()
  _REFRESHES = _REFRESHES + 1
  return "  Refreshes: " .. _REFRESHES
end

M.get_operating_system = function()
  if _OPERATING_SYSTEM == nil then
    local separator = package.config:sub(1, 1)

    if separator == "/" then
      _OPERATING_SYSTEM = _capture("uname")
    else
      _OPERATING_SYSTEM = "Windows"
    end
  end

  return _get_os_icon(_OPERATING_SYSTEM) .. " " .. _OPERATING_SYSTEM
end

M.split = function(inputstr, sep)
  if sep == nil then
    sep = "%s"
  end
  local t = {}

  for str in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
    table.insert(t, str)
  end

  return t
end

return M
