local wezterm = require("wezterm")
local act = wezterm.action

local SOLID_LEFT_ARROW = utf8.char(0xe0b2)
local SOLID_RIGHT_ARROW = utf8.char(0xe0b0)

local list = {
  font = wezterm.font('RobotoMono NF', { weight = 'Bold' }),
  color_scheme = "3024 Night",
  scrollback_lines = 3500,
  enable_scroll_bar = true,
  -- default_prog = { 'C:\\Program Files\\PowerShell\\7\\pwsh.exe', },
  default_prog = { 'C:\\Program Files\\nu\\bin\\nu.exe', },
  default_cwd = "C:\\Users\\__M__\\Documents\\COM",
 window_padding = {
  left = '1cell',
  right = '1cell',
  top = '0.5cell',
  bottom = '0.5cell',
} , 
    keys = {
    {
      key = 'Enter',
      mods = 'CTRL',
      action = wezterm.action.SplitPane { direction = 'Down', size = { Percent = 30 } }
    },
    {
      key = '1',
      mods = 'CTRL',
      action = wezterm.action.SplitPane {
        direction = 'Right', size = { Percent = 60 },
      },
    },
    {
      key = '2',
      mods = 'CTRL',
      action = wezterm.action.SplitPane {
        direction = 'Left', size = { Percent = 60 },
      },
    },
    {
      key = '3',
      mods = 'CTRL',
      action = wezterm.action.SplitPane {
        direction = 'Up', size = { Percent = 60 },
      },
    },
    {
      key = '4',
      mods = 'CTRL',
      action = wezterm.action.SplitPane {
        direction = 'Down', size = { Percent = 60 },
      },
    },
    {
      key = 'F',
      mods = 'CTRL',
      action = wezterm.action.ToggleFullScreen,
    },
    {
      key = 'Enter',
      mods = 'ALT',
      action = wezterm.action.DisableDefaultAssignment,
    },
    {
      key = 'w',
      mods = 'CTRL',
      action = wezterm.action.CloseCurrentPane { confirm = true },
    },
    {
      key = 'W',
      mods = 'CTRL',
      action = wezterm.action.CloseCurrentTab{ confirm = true },
    },
    { key = '1',  mods = 'ALT', action = act.ActivatePaneByIndex(0) },
    { key = '2',  mods = 'ALT', action = act.ActivatePaneByIndex(1) },
    { key = '3',  mods = 'ALT', action = act.ActivatePaneByIndex(2) },
    { key = '4',  mods = 'ALT', action = act.ActivatePaneByIndex(3) },
    { key = '\\', mods = 'ALT', action = wezterm.action.ShowLauncher },
  },
  tab_bar_at_bottom = true,
  --  quick cd
  launch_menu = {
    { label = "VueBeginer",          cwd = "C:\\Users\\__M__\\Documents\\COM\\IVue", },
    { label = "Vue",                 cwd = "C:\\Users\\__M__\\Documents\\COM\\vue", },
    { label = "Java",                cwd = "C:\\Users\\__M__\\Documents\\COM\\java\\IJavaTask", },
    { label = "Python",              cwd = "C:\\Users\\__M__\\Documents\\COM\\py", },
    { label = "Rust",                cwd = "C:\\Users\\__M__\\Documents\\COM\\rs", },
    { label = "CC",                  cwd = "C:\\Users\\__M__\\Documents\\COM\\cc", },
    { label = "Helix helix.log",     cwd = "C:\\Users\\__M__\\AppData\\Local\\helix", },
    { label = "Helix Langages.toml", cwd = "C:\\Users\\__M__\\AppData\\Roaming\\helix", },
    { label = "neovim config",       cwd = "C:\\Users\\__M__\\AppData\\Local\\nvim", },
    { label = "HOME",                cwd = "C:\\Users\\__M__", },
    { label = "COM",                 cwd = "C:\\Users\\__M__\\Documents\\COM", },
  },
}


wezterm.on('format-window-title', function(tab, pane, tabs, panes, config)
  local zoomed = ''
  if tab.active_pane.is_zoomed then
    zoomed = '[Z] '
  end
  local index = ''
  index = string.format('  [%d]    @  <%d> ', #tabs, tab.tab_index + 1)
  return zoomed .. index
end)

wezterm.on(
  'format-tab-title',
  function(tab, tabs, panes, config, hover, max_width)
    local edge_background = '#0b0022'
    local background = '#1b1032'
    local foreground = '#808080'

    if tab.is_active then
      background = '#2b2042'
      foreground = '#c0c0c0'
    elseif hover then
      background = '#3b3052'
      foreground = '#909090'
    end

    local edge_foreground = background

    local title = wezterm.truncate_right(tab.active_pane.title, max_width - 2)

    return {
      { Background = { Color = edge_background } },
      { Foreground = { Color = edge_foreground } },
      { Text = SOLID_LEFT_ARROW },
      { Background = { Color = background } },
      { Foreground = { Color = foreground } },
      { Text = title },
      { Background = { Color = edge_background } },
      { Foreground = { Color = edge_foreground } },
      { Text = SOLID_RIGHT_ARROW },
    }
  end
)

return list
