{pkgs, ...}: {
  programs.waybar = {
    enable = true;
    systemd = {
      enable = false;
      target = "graphical-session.target";
    };
    style = builtins.readFile ./base.css;
    settings = let
      runBtopWithAlacritty = "${pkgs.alacritty}/bin/alacritty -e ${pkgs.btop}/bin/btop";
    in [
      {
        "position" = "top";
        "layer" = "top";

        modules-left = [
          "custom/launcher"
          # "user"
          "hyprland/workspaces"
          "tray"
        ];

        modules-center = [
          "custom/clock"
        ];

        modules-right = [
          "memory"
          "cpu"
          "battery"
          "network"
          "custom/power"
        ];

        "hyprland/workspaces" = {
          "format" = "{icon}";
          "active-only" = true;
          "format-icons" = {
            "1" = "1";
            "2" = "2";
            "3" = "3";
            "4" = "4";
            "5" = "5";
            "6" = "6";
            "7" = "7";
            "8" = "8";
            "9" = "9";
            "10" = "10";
          };
        };

        "custom/launcher" = {
          "format" = " ";
          "on-click" = "pkill rofi || rofi2";
          "on-click-middle" = "exec default_wall";
          "on-click-right" = "exec wallpaper_random";
          "tooltip" = false;
        };

        "pulseaudio" = {
          "scroll-step" = 1;
          "format" = "{icon}  {volume}%";
          "format-muted" = "󰖁 Muted";
          "format-icons" = {
            "default" = ["" "" ""];
          };
          "on-click" = "pamixer -t";
          "tooltip" = false;
        };

        "custom/clock" = {
          "exec" = "date +' %H:%M'";
          "interval" = 2;
          "tooltip" = false;
          "on-click" = "${pkgs.gsimplecal}/bin/gsimplecal";
        };

        "cpu" = {
          "interval" = 1;
          "format" = "󰍛 {usage}%";
          "on-click" = runBtopWithAlacritty;
        };

        "memory" = {
          "interval" = 1;
          "format" = "󰻠 {percentage}%";
          "states" = {
            "warning" = 80;
            "critical" = 95;
          };
          "on-click" = runBtopWithAlacritty;
        };

        "battery" = {
          "states" = {
            "warning" = 30;
            "critical" = 15;
          };
          "interval" = 3;
          "format" = "{icon} {capacity}%";
          "format-charging" = "󰂄 {capacity}%";
          "format-plugged" = "󱟠 {capacity}%";
          "format-alt" = "{time} {icon}";
          "format-full" = "󱟢 {capacity}%";
          "format-icons" = ["󰁺" "󰁻" "󰁽" "󰁿" "󰂀" "󰂂"];
        };

        "network" = {
          "format-disconnected" = "󰯡 Lost";
          "format-ethernet" = "󰒢 Connected";
          "format-linked" = "󰖪  {essid} (No IP)";
          "format-wifi" = "󰖩  {ipaddr}/{cidr}";
          "interval" = 5;
          "tooltip" = true;
          "tooltip-format" = "{ifname} ^ {essid} ({frequency}MHz)"; # 󰤨
          # "on-click" = "${rofi-network-manager}/bin/rofi-network-manager";
        };

        "custom/power" = {
          "format" = "";
          "on-click" = ''${pkgs.rofi}/bin/rofi -modi "power-menu:${pkgs.rofi-power-menu}/bin/rofi-power-menu" -show power-menu'';
          "tooltip" = false;
        };

        "tray" = {
          "icon-size" = 15;
          "spacing" = 10;
        };

        "user" = {
          "format" = "{avatar}";
          "interval" = 60;
          "height" = 30;
          "width" = 30;
          "icon" = true;
        };
      }
    ];
  };
}
