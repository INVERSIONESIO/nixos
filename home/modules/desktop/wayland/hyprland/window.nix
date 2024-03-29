let
  rulesToWithIdentifier = suffix: list: builtins.map (b: b + ", " + suffix) list;
in {
  general = ''
    layout = dwindle

    gaps_in = 3
    gaps_out = 12
    border_size = 1

    col.active_border = rgba(0, 0, 0, 0.9)
    col.inactive_border = rgba(59595900)
  '';

  decoration = ''
    rounding = 4
    blur {
        enabled = true
        size = 1
        passes = 1
    }

    active_opacity = 1.0
    inactive_opacity = 0.9
    fullscreen_opacity = 1.0

    drop_shadow = yes
    shadow_range = 2
    shadow_render_power = 3
    col.shadow = rgba(1a1a1aee)
  '';

  animations = ''
    enabled = yes
    bezier = myBezier, 0.05, 0.9, 0.1, 1.05

    animation = windows, 1, 7, myBezier
    animation = windowsOut, 1, 7, default, popin 80%
    animation = border, 1, 10, default
    animation = borderangle, 1, 8, default
    animation = fade, 1, 7, default
    animation = workspaces, 1, 6, default
  '';

  # See https://wiki.hyprland.org/Configuring/Window-Rules/ for more
  rulesv2 = rulesToWithIdentifier "class:^(GLava)$ title:^(GLava)$" [
    "fullscreen"
    "float"
    "noblur"
    "nofocus"
    "noshadow"
    "noborder"
    "pin"
    "move 0 0"
    "size 100% 100%"
    "opacity 0.1"
  ];
}
