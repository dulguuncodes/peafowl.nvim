local colors = require("statusline.colors")

local buffer_not_empty = function()
    if vim.fn.empty(vim.fn.expand('%:t')) ~= 1 then return true end
    return false
end

local checkwidth = function()
    local squeeze_width = vim.fn.winwidth(0) / 2
    if squeeze_width > 40 then return true end
    return false
end

--- Checks if current buffer is in a Git repository
local check_for_git = function()
    if buffer_not_empty() and
        require("galaxyline.condition").check_git_workspace() then
        return colors.blue
    end
    return colors.bg
end

local buffer_check = function()
    if buffer_not_empty() then return colors.fg end
    return colors.white
end

local git_patch = function()
    if buffer_not_empty() then return check_for_git() end
    return colors.bg
end

local spacing = function() return ' ' end

local split = function(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={}

    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        table.insert(t, str)
    end

    return t
end


local utils = {
    buffer_not_empty = buffer_not_empty,
    buffer_check = buffer_check,
    checkwidth = checkwidth,
    check_for_git = check_for_git,
    spacing = spacing,
    git_patch = git_patch,
    split = split
}

return utils
