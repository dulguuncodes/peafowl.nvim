local colors = require("colors")
local util = require("statusline.utilities")
local constants = require("statusline.constants")

local M = {}

M.refreshes = {
  provider = constants.refreshes_provider,
  highlight = constants.refreshes_highlight
}

M.start_padding = {
  provider = util.spacing,
  highlight = {colors.black, colors.black}
}

M.empty_buffer = {
  condition = constants.empty_buffer_condition,
  provider = constants.empty_buffer_provider,
  highlight = constants.empty_buffer_highlight,
  separator = constants.empty_buffer_separator,
  separator_highlight = constants.empty_buffer_separator_highlight
}

M.file_icon = {
  provider = constants.file_icon_provider,
  condition = constants.file_icon_condition,
  highlight = constants.file_icon_highlight
}

M.file_name = {
  provider = constants.file_name_provider,
  condition = constants.file_name_condition,
  highlight = constants.file_name_highlight,
  separator = constants.file_name_separator,
  separator_highlight = constants.file_name_separator_highlight
}

M.diff_add = {
  provider = constants.diff_add_provider,
  condition = constants.diff_add_condition,
  icon = constants.diff_add_icon,
  highlight = constants.diff_add_highlight
}

M.diff_modified = {
  provider = constants.diff_modified_provider,
  condition = constants.diff_modified_condition,
  icon = constants.diff_modified_icon,
  highlight = constants.diff_modified_highlight
}

M.diff_removed = {
  provider = constants.diff_removed_provider,
  condition = constants.diff_removed_condition,
  icon = constants.diff_removed_icon,
  highlight = constants.diff_removed_highlight
}

M.lsp_error = {
  provider = constants.lsp_error_provider,
  icon = constants.lsp_error_icon,
  highlight = constants.lsp_error_highlight
}

M.left_space = {
  provider = constants.left_space_provider,
  highlight = constants.left_space_highlight,
  condition = constants.left_space_condition
}

M.space = {
  provider = constants.space_provider,
  highlight = constants.space_highlight
}

M.lsp_warnings = {
  provider = constants.lsp_warnings_provider,
  icon = constants.lsp_warnings_icon,
  highlight = constants.lsp_warnings_highlight
}

M.vi_mode = {
  provider = constants.vi_mode_provider,
  highlight = constants.vi_mode_highlight,
  separator = constants.vi_mode_separator,
  separator_highlight = constants.vi_mode_separator_highlight
}

M.line_percentage = {
  provider = constants.line_percentage_provider,
  separator = constants.line_percentage_separator,
  separator_highlight = constants.line_percentage_separator_highlight,
  highlight = constants.line_percentage_highlight
}

M.left_cursor_icon = {
  provider = constants.left_cursor_icon_provider,
  condition = constants.left_cursor_icon_condition,
  highlight = constants.left_cursor_icon_highlight
}

M.right_cursor_icon = {
  provider = constants.right_cursor_icon_provider,
  condition = constants.right_cursor_icon_condition,
  highlight = constants.right_cursor_icon_highlight,
  separator = constants.right_cursor_icon_separator,
  separator_highlight = constants.right_cursor_icon_separator_highlight
}

M.left_cursor_position = {
  provider = constants.left_cursor_position_provider,
  condition = constants.left_cursor_position_condition,
  highlight = constants.left_cursor_position_highlight,
  separator = constants.left_cursor_position_separator,
  separator_highlight = constants.left_cursor_position_separator_highlight
}

M.right_cursor_position = {
  provider = constants.right_cursor_position_provider,
  condition = constants.right_cursor_position_condition,
  highlight = constants.right_cursor_position_highlight
}

M.branding = {
  provider = constants.branding_provider,
  condition = constants.branding_condition,
  highlight = constants.branding_highlight
}

M.logo = {
  provider = constants.logo_provider,
  highlight = constants.logo_highlight,
  condition = constants.logo_condition,
  separator = constants.logo_separator,
  separator_highlight = constants.logo_separator_highlight
}

M.workspace = {
  provider = constants.workspace_provider,
  highlight = constants.workspace_highlight,
  separator = constants.workspace_separator,
  separator_highlight = constants.workspace_separator_highlight
}

M.operating_system = {
  provider = constants.operating_system_provider,
  condition = constants.operating_system_condition,
  highlight = constants.operating_system_highlight,
  separator = constants.operating_system_separator,
  separator_highlight = constants.operating_system_separator_highlight
}

M.left_padding = {
  provider = constants.left_padding_provider,
  highlight = constants.left_padding_highlight,
  condition = constants.left_padding_condition
}

M.right_padding = {
  provider = constants.right_padding_provider,
  highlight = constants.right_padding_highlight,
  condition = constants.right_padding_condition
}

M.space_between_fname_and_cur_pos = {
  provider = constants.space_between_fname_and_cur_pos_provider,
  highlight = constants.space_between_fname_and_cur_pos_highlight,
  condition = constants.space_between_fname_and_cur_pos_condition
}

M.left_line_ending = {
  provider = constants.left_line_ending_provider,
  highlight = constants.left_line_ending_highlight
}

M.minified_meta_padding = {
  provider = constants.minified_meta_padding_provider,
  highlight = constants.minified_meta_padding_highlight,
  conition = constants.minified_meta_padding_condition
}

return M
