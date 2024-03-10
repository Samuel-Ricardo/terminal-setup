local status, n = pcall(require, 'neosolarized')
if (not status) then return end
 
n.setup({ comment_italics = true })

local colorbuddy = require('colorbuddy.init')
local Color = colorbuddy.Color
local colors = colorbuddy.colors
local Group = colorbuddy.Group
local groups = colorbuddy.groups
local styles = colorbuddy.styles

Color.new('black', '#000000')
Color.new('white', '#ffffff')

Group.new('CursorLine', colors.none, colors.base03, styles.NONE, colors.base1)
Group.new('CursorLineNr', colors.yellow, colors.black, styles.NONE, colors.base1)
Group.new('Visual', colors.none, colors.base03, styles.reverse)

local cError = groups.Error.fg
local cInfo = groups.Information.fg
local cWarn = groups.Warning.fg
local cHint = groups.Hint.fg

Group.new("DiagnosticVirtualTextError", cError, cError:dark():dark():dark():dark(), styles.NONE)
Group.new("DiagnosticVirtualTextInfo", cInfo, cInfo:dark():dark():dark(), styles.NONE)
Group.new("DiagnosticVirtualTextWarn", cWarn, cWarn:dark():dark():dark(), styles.NONE)
Group.new("DiagnosticVirtualTextHint", cHint, cHint:dark():dark():dark(), styles.NONE)

Group.new("DiagnosticUnderLineError", colors.none, colors.none, styles.undercurl, cError)
Group.new("DiagnosticUnderLineWarn", colors.none, colors.none, styles.undercurl, cWarn)
Group.new("DiagnosticUnderLineInfo", colors.none, colors.none, styles.undercurl, cInfo)
Group.new("DiagnosticUnderLineHint", colors.none, colors.none, styles.undercurl, cHint)
