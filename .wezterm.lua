--[[
                ████─█─█─███─███─████─█───█
                █──█─█─█─█────█──█──█─██─██
                █────█─█─███──█──█──█─█─█─█
                █──█─█─█───█──█──█──█─█───█
                ████─███─███──█──████─█───█
--]]
-- -------------------------------------------------------------

local user_name= "io"
local workspace = ".code"
local default_font = "RobotoMono Nerd Font"
local default_image ="wezterm_image.png"
local font_weight = "Bold"
local default_shell_path= "C:\\Program Files\\nu\\bin\\nu.exe"


-- -------------------------------------------------------------
--[[
              ╔══╗─╔═══╗╔══╗╔══╗╔╗╔╗╔╗──╔════╗
              ║╔╗╚╗║╔══╝║╔═╝║╔╗║║║║║║║──╚═╗╔═╝
              ║║╚╗║║╚══╗║╚═╗║╚╝║║║║║║║────║║──
              ║║─║║║╔══╝║╔═╝║╔╗║║║║║║║────║║──
              ║╚═╝║║╚══╗║║──║║║║║╚╝║║╚═╗──║║──
              ╚═══╝╚═══╝╚╝──╚╝╚╝╚══╝╚══╝──╚╝──
--]]

local wezterm = require 'wezterm'
local mux = wezterm.mux
local config = {}

wezterm.on('gui-attached', function()
  for _, window in ipairs(mux.all_windows()) do
      window:gui_window():maximize()
  end
end)

config.window_background_opacity = 0.27
config.text_background_opacity = 0.56
config.freetype_load_target = 'Light'
config.freetype_render_target = 'HorizontalLcd'
config.animation_fps = 60
config.cursor_blink_ease_in = 'Constant'
config.cursor_blink_ease_out = 'Constant'
config.anti_alias_custom_block_glyphs = true
config.window_decorations = "NONE"
config.default_prog = { default_shell_path }
config.default_cwd = "C:\\Users\\"..user_name.."\\"..workspace
config.font = wezterm.font(default_font,{weight=font_weight})
config.window_background_image = 'C:\\Users\\io\\Pictures\\'..default_image

return config
