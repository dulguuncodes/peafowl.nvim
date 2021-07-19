local colors = require("colors")
local util = require("statusline.utilities")
local vcs = require('galaxyline.provider_vcs')
local constants = require("statusline.constants")

local fileinfo = require('galaxyline.provider_fileinfo')

local start_padding = {
    provider = util.spacing,
    highlight = {colors.black, colors.black}
}

local empty_buffer = {
    condition = constants.empty_buffer_condition,
    provider = constants.empty_buffer_provider,
    highlight = constants.empty_buffer_highlight,
    separator = constants.empty_buffer_separator,
    separator_highlight = constants.empty_buffer_separator_highlight
}

local file_icon = {
    provider = constants.file_icon_provider,
    condition = constants.file_icon_condition,
    highlight = constants.file_icon_highlight
}

local file_name = {
    provider = constants.file_name_provider,
    condition = constants.file_name_condition,
    highlight = constants.file_name_highlight,
    separator = constants.file_name_separator,
    separator_highlight = constants.file_name_separator_highlight
}

local diff_add = {
    provider = constants.diff_add_provider,
    condition = constants.diff_add_condition,
    icon = constants.diff_add_icon,
    highlight = constants.diff_add_highlight
}

local diff_modified = {
    provider = constants.diff_modified_provider,
    condition = constants.diff_modified_condition,
    icon = constants.diff_modified_icon,
    highlight = constants.diff_modified_highlight
}

local diff_removed = {
    provider = constants.diff_removed_provider,
    condition = constants.diff_removed_condition,
    icon = constants.diff_removed_icon,
    highlight = constants.diff_removed_highlight
}

local lsp_error = {
    provider = constants.lsp_error_provider,
    icon = constants.lsp_error_icon,
    highlight = constants.lsp_error_highlight
}

local left_space = {
    provider = constants.left_space_provider,
    highlight = constants.left_space_highlight,
    condition = constants.left_space_condition
}

local space = {
    provider = constants.space_provider,
    highlight = constants.space_highlight
}

local lsp_warnings = {
    provider = constants.lsp_warnings_provider,
    icon = constants.lsp_warnings_icon,
    highlight = constants.lsp_warnings_highlight
}

local vi_mode = {
    provider = constants.vi_mode_provider,
    highlight = constants.vi_mode_highlight,
    separator = constants.vi_mode_separator,
    separator_highlight = constants.vi_mode_separator_highlight
}

local line_percentage = {
    provider = constants.line_percentage_provider,
    separator = constants.line_percentage_separator,
    separator_highlight = constants.line_percentage_separator_highlight,
    highlight = constants.line_percentage_highlight
}

local left_cursor_icon = {
    provider = constants.left_cursor_icon_provider,
    condition = constants.left_cursor_icon_condition,
    highlight = constants.left_cursor_icon_highlight
}

local right_cursor_icon = {
    provider = constants.right_cursor_icon_provider,
    condition = constants.right_cursor_icon_condition,
    highlight = constants.right_cursor_icon_highlight,
    separator = constants.right_cursor_icon_separator,
    separator_highlight = constants.right_cursor_icon_separator_highlight
}

local left_cursor_position = {
    provider = constants.left_cursor_position_provider,
    condition = constants.left_cursor_position_condition,
    highlight = constants.left_cursor_position_highlight,
    separator = constants.left_cursor_position_separator,
    separator_highlight = constants.left_cursor_position_separator_highlight
}

local right_cursor_position = {
    provider = constants.right_cursor_position_provider,
    condition = constants.right_cursor_position_condition,
    highlight = constants.right_cursor_position_highlight
}

local branding = {
    provider = constants.branding_provider,
    condition = constants.branding_condition,
    highlight = constants.branding_highlight
}

local logo = {
    provider = constants.logo_provider,
    highlight = constants.logo_highlight,
    condition = constants.logo_condition,
    separator = constants.logo_separator,
    separator_highlight = constants.logo_separator_highlight
}

local workspace = {
    provider = constants.workspace_provider,
    highlight = constants.workspace_highlight,
		separator = constants.workspace_separator,
		separator_highlight = constants.workspace_separator_highlight
}

local operating_system = {
    provider = constants.operating_system_provider,
    condition = constants.operating_system_condition,
    highlight = constants.operating_system_highlight,
    separator = constants.operating_system_separator,
    separator_highlight = constants.operating_system_separator_highlight
}

local left_padding = {
    provider = constants.left_padding_provider,
    highlight = constants.left_padding_highlight,
    condition = constants.left_padding_condition
}

local right_padding = {
    provider = constants.right_padding_provider,
    highlight = constants.right_padding_highlight,
    condition = constants.right_padding_condition
}

local space_between_fname_and_cur_pos = {
    provider = constants.space_between_fname_and_cur_pos_provider,
    highlight = constants.space_between_fname_and_cur_pos_highlight,
    condition = constants.space_between_fname_and_cur_pos_condition
}

local left_line_ending = {
    provider = constants.left_line_ending_provider,
    highlight = constants.left_line_ending_highlight
}

local minified_meta_padding = {
    provider = constants.minified_meta_padding_provider,
    highlight = constants.minified_meta_padding_highlight,
    conition = constants.minified_meta_padding_condition
}

local components = {
    LeftPadding = {
        LeftPadding = left_padding
    },

    LeftSpace = {
        LeftSpace = left_space
    },
    LeftLineEnding = {
        LeftLineEnding = left_line_ending
    },
    StartPadding = {
        StartPadding = start_padding
    },

    EmptyBuffer = {
        EmptyBuffer = empty_buffer
    },
    MinifiedMetaPadding = {
        MinifiedMetaPadding = minified_meta_padding
    },
    FileIcon = {
        FileIcon = file_icon
    },
    FileName = {
        FileName = file_name
    },

    DiffAdd = {
        DiffAdd = diff_add
    },
    DiffModified = {
        DiffModified = diff_modified
    },
    DiffRemoved = {
        DiffRemoved = diff_removed
    },

    LSPError = {
        LSPError = lsp_error
    },
    LSPWarnings = {
        LSPWarnings = lsp_warnings
    },

    Space = {
        Space = space
    },
    SpaceFg = {
        SpaceFg = space_fg
    },
    SpaceFg2 = {
        SpaceFg2 = space_fg2
    },
    SpaceFg3 = {
        SpaceFg3 = space_fg3
    },
    SpaceInBetweenFnameAndCur = {
        SpaceInBetweenFnameAndCur = space_between_fname_and_cur_pos
    },

    LinePercentage = {
        LinePercentage = line_percentage
    },

    LeftCursorIcon = {
        LeftCursorIcon = left_cursor_icon
    },
    RightCursorIcon = {
        RightCursorIcon = right_cursor_icon
    },

    LeftCursorPosition = {
        LeftCursorPosition = left_cursor_position
    },
    RightCursorPosition = {
        RightCursorPosition = right_cursor_position
    },

    Branding = {
        Branding = branding
    },

    Logo = {
        Logo = logo
    },
    Workspace = {
        Workspace = workspace
    },
    OperatingSystem = {
        OperatingSystem = operating_system
    },
    ViMode = {
        ViMode = vi_mode
    },

    RightPadding = {
        RightPadding = right_padding
    }
}

return components
