self: let
  inherit (import ./binds.nix self) mainMod binds mouseBinds;

  window = import ./window.nix;
  exec = {
    always = [
      "pkill waybar & sleep 0.1 && waybar"
    ];

    once = [
      "${self.pkgs.wl-clipboard}/bin/wl-paste --watch ${self.pkgs.cliphist}/bin/cliphist store -max-items 200"
      "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
    ];
  };

  rules = ''
    autogenerated = 0
    monitor=,highrr,auto,1
    monitor=DP-1, highres, 1920x0, 1
    monitor=DP-2, 1600x900, 0x0, 1
    env = XCURSOR_SIZE,24

    input {
        numlock_by_default = true
        sensitivity = 0.2

        kb_layout = latam
        kb_variant =
        kb_model =
        kb_options =
        kb_rules =

        follow_mouse = 1

        touchpad {
            natural_scroll = no
            disable_while_typing = no
        }
    }

    misc {
        disable_hyprland_logo = true
    }

    dwindle {
        # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
        pseudotile = yes
        preserve_split = yes
    }

    master {
        # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
        new_is_master = true
    }

    gestures {
        workspace_swipe = off
    }
  '';

  listToPrefixedLines = prefix: list: self.lib.strings.concatMapStrings (b: prefix + b + "\n") list;
in {
  # More keysyms here: https://github.com/xkbcommon/libxkbcommon/blob/master/include/xkbcommon/xkbcommon-keysyms.h
  xdg.configFile."hypr/hyprland.conf".text = ''
    ${listToPrefixedLines "exec-once = " exec.once}

    ${rules}
    $mainMod = ${mainMod}

    general {
      ${window.general}
    }

    decoration {
      ${window.decoration}
    }

    animations {
      ${window.animations}
    }

    ${listToPrefixedLines "windowrulev2 = " window.rulesv2}

    ${listToPrefixedLines "exec = " exec.always}
    ${listToPrefixedLines "bind = " binds}
    ${listToPrefixedLines "bindm = " mouseBinds}
  '';
}