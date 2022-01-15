local action_state = require "telescope.actions.state"
local pickers = require "telescope.pickers"
local actions = require "telescope.actions"
local finders = require "telescope.finders"
local colorschemes = require('colorschemes')

local M = {}

M.colorschemes = function(opts)
  local options = {}

  for k in pairs(colorschemes) do
    table.insert(options, k)
  end

  local picker = pickers.new(opts, {
    prompt_title = "Change Colorscheme",
    finder = finders.new_table {
      results = options,
    },
    attach_mappings = function(prompt_bufnr)
      actions.select_default:replace(function()
        local selection = action_state.get_selected_entry()

        if selection == nil then
          print "[telescope] Nothing currently selected"
          return
        end

        local colorscheme = require('colorschemes')[selection[1]]

        if colorscheme == nil then
          error("[peafowl] No such colorscheme exists")
          return
        end

        colorscheme.switch()

        actions.close(prompt_bufnr)

      end)

      return true
    end
  })

  picker:find()
end

return M
