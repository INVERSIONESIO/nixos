# https://wiki.hyprland.org/Configuring/Keywords/
{
  dunstify-brightness,
  dunstify-sound,
  cliphist-rofi,
  spotify-dbus,
  grimblast,
  hyprland,
  pkgs,
  ...
}: {
  mainMod = "SUPER";

  binds = let
    window = [
      "$mainMod, left, movefocus, l"
      "$mainMod, right, movefocus, r"
      "$mainMod, up, movefocus, u"
      "$mainMod, down, movefocus, d"
    ];

    workspaces = [
      # Go-to
      "$mainMod, 1, focusmonitor, 0"
      "$mainMod, 1, focusworkspaceoncurrentmonitor, 1"
      "$mainMod, 2, focusmonitor, 0"
      "$mainMod, 2, focusworkspaceoncurrentmonitor, 2"
      "$mainMod, 3, focusmonitor, 0"
      "$mainMod, 3, focusworkspaceoncurrentmonitor, 3"
      "$mainMod, 4, focusmonitor, 0"
      "$mainMod, 4, focusworkspaceoncurrentmonitor, 4"
      "$mainMod, 5, focusmonitor, 0"
      "$mainMod, 5, focusworkspaceoncurrentmonitor, 5"
      "$mainMod, 6, focusmonitor, 0"
      "$mainMod, 6, focusworkspaceoncurrentmonitor, 6"
      "$mainMod, 7, focusmonitor, 0"
      "$mainMod, 7, focusworkspaceoncurrentmonitor, 7"
      "$mainMod, 8, focusmonitor, 0"
      "$mainMod, 8, focusworkspaceoncurrentmonitor, 8"
      "$mainMod, 9, focusmonitor, 0"
      "$mainMod, 9, focusworkspaceoncurrentmonitor, 9"
      "$mainMod, 0, focusmonitor, 0"
      "$mainMod, 0, focusworkspaceoncurrentmonitor, 10"

      # Go-to
      "$mainMod ALT, 1, focusmonitor, 1"
      "$mainMod ALT, 1, focusworkspaceoncurrentmonitor, 1"
      "$mainMod ALT, 2, focusmonitor, 1"
      "$mainMod ALT, 2, focusworkspaceoncurrentmonitor, 2"
      "$mainMod ALT, 3, focusmonitor, 1"
      "$mainMod ALT, 3, focusworkspaceoncurrentmonitor, 3"
      "$mainMod ALT, 4, focusmonitor, 1"
      "$mainMod ALT, 4, focusworkspaceoncurrentmonitor, 4"
      "$mainMod ALT, 5, focusmonitor, 1"
      "$mainMod ALT, 5, focusworkspaceoncurrentmonitor, 5"
      "$mainMod ALT, 6, focusmonitor, 1"
      "$mainMod ALT, 6, focusworkspaceoncurrentmonitor, 6"
      "$mainMod ALT, 7, focusmonitor, 1"
      "$mainMod ALT, 7, focusworkspaceoncurrentmonitor, 7"
      "$mainMod ALT, 8, focusmonitor, 1"
      "$mainMod ALT, 8, focusworkspaceoncurrentmonitor, 8"
      "$mainMod ALT, 9, focusmonitor, 1"
      "$mainMod ALT, 9, focusworkspaceoncurrentmonitor, 9"
      "$mainMod ALT, 0, focusmonitor, 1"
      "$mainMod ALT, 0, focusworkspaceoncurrentmonitor, 10"

      # Move window
      "$mainMod SHIFT, 1, movewindow, mon:0"

      "$mainMod SHIFT, 2, movewindow, mon:1"

      # Resize window
      "$mainMod SHIFT, h, resizeactive, -40 0"
      "$mainMod SHIFT, l, resizeactive, 40 0"
      "$mainMod SHIFT, k, resizeactive, 0 -40"
      "$mainMod SHIFT, j, resizeactive, 0 40"

      # Scroll
      "$mainMod, mouse_down, workspace, e+1"
      "$mainMod, mouse_up, workspace, e-1"

      # Other actions
      "$mainMod, SPACE, togglefloating"
      "$mainMod, MINUS, togglesplit"
      "SUPER_SHIFT, W, killactive"
      "SUPER_SHIFT, MINUS, pseudo"
      "$mainMod, F, fullscreen"
    ];

    custom = let
      rofi-plugin-call = name: program-to-exec: ''${pkgs.rofi}/bin/rofi -modi "${name}:${program-to-exec}" -show ${name}'';
    in [
      {
        "mod+key" = "$mainMod, RETURN";
        "dispatcher" = "exec, ${pkgs.alacritty}/bin/alacritty";
      }
      {
        "mod+key" = ",XF86AudioMicMute";
        "dispatcher" = "exec, ${dunstify-sound}/bin/dunstify-sound --toggle-mic";
      }
      {
        "mod+key" = ",XF86AudioMute";
        "dispatcher" = "exec, ${dunstify-sound}/bin/dunstify-sound --toggle-vol";
      }
      {
        "mod+key" = ",XF86AudioLowerVolume";
        "dispatcher" = "exec, ${dunstify-sound}/bin/dunstify-sound --dec";
      }
      {
        "mod+key" = ",XF86AudioRaiseVolume";
        "dispatcher" = "exec, ${dunstify-sound}/bin/dunstify-sound --inc";
      }
      {
        "mod+key" = "SUPER, XF86AudioRaiseVolume";
        "dispatcher" = "exec, ${dunstify-sound}/bin/dunstify-sound --inc --unleashed";
      }
      {
        "mod+key" = "SUPER_SHIFT, Print";
        "dispatcher" = "exec, ${grimblast}/bin/grimblast --freeze --notify copy area";
      }
      {
        "mod+key" = "$mainMod, Print";
        "dispatcher" = "exec, ${grimblast}/bin/grimblast --notify copy active";
      }
      {
        "mod+key" = ",Print";
        "dispatcher" = "exec, ${grimblast}/bin/grimblast --notify copy screen";
      }
      {
        "mod+key" = ",XF86MonBrightnessDown";
        "dispatcher" = "exec, ${dunstify-brightness}/bin/dunstify-brightness --dec";
      }
      {
        "mod+key" = ",XF86MonBrightnessUp";
        "dispatcher" = "exec, ${dunstify-brightness}/bin/dunstify-brightness --inc";
      }
      {
        "mod+key" = "SUPER_SHIFT, C";
        "dispatcher" = "exec, ${rofi-plugin-call "clipboard" "${cliphist-rofi}/bin/cliphist-rofi"}";
      }
      {
        "mod+key" = "SUPER_SHIFT, Q";
        "dispatcher" = "exec, ${pkgs.rofi}/bin/rofi -show window";
      }
      {
        "mod+key" = "$mainMod, Q";
        "dispatcher" = "exec, ${pkgs.rofi}/bin/rofi -show drun";
      }
      {
        "mod+key" = "SUPER_SHIFT, braceright";
        "dispatcher" = "exec, ${spotify-dbus}/bin/spotify-dbus --next";
      }
      {
        "mod+key" = "SUPER_SHIFT, braceleft";
        "dispatcher" = "exec, ${spotify-dbus}/bin/spotify-dbus --prev";
      }
      {
        "mod+key" = "$mainMod, Pause";
        "dispatcher" = "exec, ${spotify-dbus}/bin/spotify-dbus --toggle";
      }
      {
        "mod+key" = "SUPER_SHIFT, R";
        "dispatcher" = "exec, ${hyprland}/bin/hyprctl reload";
      }
    ];
  in
    window ++ workspaces ++ builtins.map (b: b."mod+key" + ", " + b.dispatcher) custom;

  mouseBinds = [
    # Move/resize windows with mainMod + LMB/RMB and dragging
    "$mainMod, mouse:272, movewindow"
    "$mainMod, mouse:273, resizewindow"
  ];
}
