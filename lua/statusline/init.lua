local gl = require('galaxyline')
local components = require("statusline.components")

gl.short_line_list = {" "}

gl.section.left = {components.LeftSpace, components.LeftPadding, components.Logo, components.StartPadding,
                   components.EmptyBuffer, components.MinifiedMetaPadding, components.FileIcon, components.FileName,
                   components.LeftCursorIcon, components.LeftCursorPosition, components.SpaceInBetweenFnameAndCur,
                   components.DiffAdd, components.DiffModified, components.DiffRemoved, components.LeftLineEnding,
                   components.LSPError, components.LSPWarnings}

if vim.g.peafowl_branding == 1 then
	gl.section.mid = {components.Branding}
end

gl.section.right = {components.Workspace, components.ViMode, components.RightCursorIcon,
                    components.RightCursorPosition, components.LinePercentage, components.OperatingSystem,
                    components.RightPadding}

