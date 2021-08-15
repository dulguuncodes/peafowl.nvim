local colors = require("colors")
local util = require("statusline.utilities")
local constants = require("statusline.constants")

local M = {}

M.Refreshes = {
  provider = constants.refreshes_provider,
  highlight = constants.refreshes_highlight
}

M.StartPadding = {
  provider = util.spacing,
  highlight = {colors.black, colors.black}
}

M.EmptyBuffer = {
  condition = constants.empty_buffer_condition,
  provider = constants.empty_buffer_provider,
  highlight = constants.empty_buffer_highlight,
  separator = constants.empty_buffer_separator,
  separator_highlight = constants.empty_buffer_separator_highlight
}

M.FileIcon = {
  provider = constants.file_icon_provider,
  condition = constants.file_icon_condition,
  highlight = constants.file_icon_highlight
}

M.FileName = {
  provider = constants.file_name_provider,
  condition = constants.file_name_condition,
  highlight = constants.file_name_highlight,
  separator = constants.file_name_separator,
  separator_highlight = constants.file_name_separator_highlight
}

M.DiffAdd = {
  provider = constants.diff_add_provider,
  condition = constants.diff_add_condition,
  icon = constants.diff_add_icon,
  highlight = constants.diff_add_highlight
}

M.DiffModified = {
  provider = constants.diff_modified_provider,
  condition = constants.diff_modified_condition,
  icon = constants.diff_modified_icon,
  highlight = constants.diff_modified_highlight
}

M.DiffRemoved = {
  provider = constants.diff_removed_provider,
  condition = constants.diff_removed_condition,
  icon = constants.diff_removed_icon,
  highlight = constants.diff_removed_highlight
}

M.LSPError = {
  provider = constants.lsp_error_provider,
  icon = constants.lsp_error_icon,
  highlight = constants.lsp_error_highlight
}

M.LeftSpace = {
  provider = constants.left_space_provider,
  highlight = constants.left_space_highlight,
  condition = constants.left_space_condition
}

M.Space = {
  provider = constants.space_provider,
  highlight = constants.space_highlight
}

M.LSPWarnings = {
  provider = constants.lsp_warnings_provider,
  icon = constants.lsp_warnings_icon,
  highlight = constants.lsp_warnings_highlight
}

M.ViMode = {
  provider = constants.vi_mode_provider,
  highlight = constants.vi_mode_highlight,
  separator = constants.vi_mode_separator,
  separator_highlight = constants.vi_mode_separator_highlight
}

M.LinePercentage = {
  provider = constants.line_percentage_provider,
  separator = constants.line_percentage_separator,
  separator_highlight = constants.line_percentage_separator_highlight,
  highlight = constants.line_percentage_highlight
}

M.LeftCursorIcon = {
  provider = constants.left_cursor_icon_provider,
  condition = constants.left_cursor_icon_condition,
  highlight = constants.left_cursor_icon_highlight
}

M.RightCursorIcon = {
  provider = constants.right_cursor_icon_provider,
  condition = constants.right_cursor_icon_condition,
  highlight = constants.right_cursor_icon_highlight,
  separator = constants.right_cursor_icon_separator,
  separator_highlight = constants.right_cursor_icon_separator_highlight
}

M.LeftCursorPosition = {
  provider = constants.left_cursor_position_provider,
  condition = constants.left_cursor_position_condition,
  highlight = constants.left_cursor_position_highlight,
  separator = constants.left_cursor_position_separator,
  separator_highlight = constants.left_cursor_position_separator_highlight
}

M.RightCursorPosition = {
  provider = constants.right_cursor_position_provider,
  condition = constants.right_cursor_position_condition,
  highlight = constants.right_cursor_position_highlight
}

M.Branding = {
  provider = constants.branding_provider,
  condition = constants.branding_condition,
  highlight = constants.branding_highlight
}

M.Logo = {
  provider = constants.logo_provider,
  highlight = constants.logo_highlight,
  condition = constants.logo_condition,
  separator = constants.logo_separator,
  separator_highlight = constants.logo_separator_highlight
}

M.Workspace = {
  provider = constants.workspace_provider,
  highlight = constants.workspace_highlight,
  separator = constants.workspace_separator,
  separator_highlight = constants.workspace_separator_highlight
}

M.OperatingSystem = {
  provider = constants.operating_system_provider,
  condition = constants.operating_system_condition,
  highlight = constants.operating_system_highlight,
  separator = constants.operating_system_separator,
  separator_highlight = constants.operating_system_separator_highlight
}

M.LeftPadding = {
  provider = constants.left_padding_provider,
  highlight = constants.left_padding_highlight,
  condition = constants.left_padding_condition
}

M.RightPadding = {
  provider = constants.right_padding_provider,
  highlight = constants.right_padding_highlight,
  condition = constants.right_padding_condition
}

M.SpaceInBetweenFnameAndCur = {
  provider = constants.space_between_fname_and_cur_pos_provider,
  highlight = constants.space_between_fname_and_cur_pos_highlight,
  condition = constants.space_between_fname_and_cur_pos_condition
}

M.LeftLineEnding = {
  provider = constants.left_line_ending_provider,
  highlight = constants.left_line_ending_highlight
}

M.MinifiedMetaPadding = {
  provider = constants.minified_meta_padding_provider,
  highlight = constants.minified_meta_padding_highlight,
  conition = constants.minified_meta_padding_condition
}

return M
