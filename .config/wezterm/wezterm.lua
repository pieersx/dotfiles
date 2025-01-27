-- Importa el módulo wezterm
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- ================================
-- 1. Configuración de Esquema de Colores
-- ================================
config.colors = {
  -- Colores principales
  foreground = "#ffffe6",
  background = "#181818",

  -- Cursor
  cursor_bg = "#c0caf5",         -- Fondo del cursor
  cursor_border = "#c0caf5",     -- Borde del cursor
  cursor_fg = "#1a1b26",         -- Texto del cursor

  -- Selección
  selection_bg = "#28344a",      -- Fondo de la selección
  selection_fg = "#7aa2f7",      -- Texto de la selección

  -- Colores ANSI (0-7)
  ansi = {
    "#414868", -- Negro
    "#f7768e", -- Rojo
    "#73daca", -- Verde
    "#e0af68", -- Amarillo
    "#7aa2f7", -- Azul
    "#bb9af7", -- Magenta
    "#7dcfff", -- Cian
    "#c0caf5", -- Blanco
  },

  -- Colores ANSI brillantes (8-15)
  brights = {
    "#414868", -- Negro brillante
    "#f7768e", -- Rojo brillante
    "#73daca", -- Verde brillante
    "#e0af68", -- Amarillo brillante
    "#7aa2f7", -- Azul brillante
    "#bb9af7", -- Magenta brillante
    "#7dcfff", -- Cian brillante
    "#c0caf5", -- Blanco brillante
  },
}

-- ================================
-- 2. Configuración de Fuentes
-- ================================
config.font = wezterm.font_with_fallback {
  { family = 'Iosevka Nerd Font', weight = 'Medium' },
  -- { family = 'MesloLGS NF', weight = 'Bold' },
  -- { family = 'Nerd Font Symbols', scale = 0.8 },
}
config.font_size = 15.0
-- config.line_height = 1.025

-- ================================
-- 3. Opciones de Ventana
-- ================================
config.window_padding = {
  left = 30,
  top = 10,
  right = 30,
  bottom = 30
}
-- config.inactive_pane_hsb = {
--   saturation = 0.24,
--   brightness = 0.5
-- }
wezterm.on("update-status", function(window, pane)
  -- Workspace name
  local stat = window:active_workspace()
  local stat_color = "#f7768e"
  -- It's a little silly to have workspace name all the time
  -- Utilize this to display LDR or current key table name
  if window:active_key_table() then
    stat = window:active_key_table()
    stat_color = "#7dcfff"
  end
  if window:leader_is_active() then
    stat = "LDR"
    stat_color = "#bb9af7"
  end

  local basename = function(s)
    -- Nothing a little regex can't fix
    return string.gsub(s, "(.*[/\\])(.*)", "%2")
  end

  -- Current working directory
  local cwd = pane:get_current_working_dir()
  if cwd then
    if type(cwd) == "userdata" then
      -- Wezterm introduced the URL object in 20240127-113634-bbcac864
      cwd = basename(cwd.file_path)
    else
      -- 20230712-072601-f4abf8fd or earlier version
      cwd = basename(cwd)
    end
  else
    cwd = ""
  end

  -- Current command
  local cmd = pane:get_foreground_process_name()
  -- CWD and CMD could be nil (e.g. viewing log using Ctrl-Alt-l)
  cmd = cmd and basename(cmd) or ""

  -- Time
  local time = wezterm.strftime("%H:%M")

  -- Left status (left of the tab line)
  window:set_left_status(wezterm.format({
    { Foreground = { Color = stat_color } },
    { Text = "  " },
    { Text = wezterm.nerdfonts.oct_table .. "  " .. stat },
    { Text = " |" },
  }))

  -- Right status
  window:set_right_status(wezterm.format({
    -- Wezterm has a built-in nerd fonts
    -- https://wezfurlong.org/wezterm/config/lua/wezterm/nerdfonts.html
    { Text = wezterm.nerdfonts.md_folder .. "  " .. cwd },
    { Text = " | " },
    { Foreground = { Color = "#e0af68" } },
    { Text = wezterm.nerdfonts.fa_code .. "  " .. cmd },
    "ResetAttributes",
    { Text = " | " },
    { Text = wezterm.nerdfonts.md_clock .. "  " .. time },
    { Text = "  " },
  }))
end)

config.window_background_opacity = 0.9
config.initial_cols = 120
config.initial_rows = 33
config.window_decorations = 'RESIZE'
config.window_close_confirmation = "AlwaysPrompt"
config.default_workspace = "main"
config.enable_tab_bar = true
-- config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.status_update_interval = 1000

-- ================================
-- 4. Configuración del Shell Predeterminado
-- ================================
config.default_prog = { 'pwsh.exe', '-l' }

-- ================================
-- 5. Historial y Scroll
-- ================================
config.scrollback_lines = 10000

-- ================================
-- 6. Keybindings Personalizados
-- ================================
config.keys = {
  -- Nueva pestaña
  { key = "t", mods = "CTRL|SHIFT", action = wezterm.action.SpawnTab "DefaultDomain" },

  -- Cerrar pestaña
  { key = "w", mods = "CTRL|SHIFT", action = wezterm.action.CloseCurrentTab { confirm = true } },

  -- Dividir paneles horizontalmente
  { key = "d", mods = "CTRL|SHIFT", action = wezterm.action.SplitHorizontal { domain = "CurrentPaneDomain" } },

  -- Dividir paneles verticalmente
  -- { key = "v", mods = "CTRL|SHIFT", action = wezterm.action.SplitVertical { domain = "CurrentPaneDomain" } },

  -- Cambiar entre pestañas
  { key = "Tab", mods = "CTRL", action = wezterm.action.ActivateTabRelative(1) },
  { key = "Tab", mods = "CTRL|SHIFT", action = wezterm.action.ActivateTabRelative(-1) },

  -- Ajuste de zoom
  { key = "z", mods = "CTRL|SHIFT", action = wezterm.action.TogglePaneZoomState },

  -- Búsqueda
  { key = "f", mods = "CTRL|SHIFT", action = wezterm.action.Search { CaseSensitiveString = "" } },
}

-- ================================
-- 7. Opciones para Desarrolladores
-- ================================
config.check_for_updates = false
config.debug_key_events = false

-- ================================
-- 8. Habilitar Plugins Adicionales
-- ================================
config.hyperlink_rules = wezterm.default_hyperlink_rules()

-- Añade soporte para direcciones GitHub y rutas locales
table.insert(config.hyperlink_rules, {
  regex = [[\bhttps://github\.com/\w+/\w+\b]],
  format = "$0",
})

-- ================================
-- 9. Mejor Compatibilidad en Windows
-- ================================
config.front_end = 'WebGpu' -- Mejora el rendimiento gráfico en Windows `OpenGl`
-- config.webgpu_preferred_adapter = 'HighPerformance' -- Usa la GPU principal

-- ================================
-- 10. Información Útil en la Barra
-- ================================
config.status_update_interval = 1000
config.window_frame = {
  active_titlebar_bg = "#2c313a",
  font = wezterm.font { family = "Iosevka", weight = "Bold" },
}

-- return the configuration to wezterm
return config
