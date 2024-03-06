{
  programs.dconf.enable = true;

  services.xserver = {
    enable = true;
    autorun = true;

    layout = "latam";

    displayManager.gdm = {
      enable = true;
      autoSuspend = false;
      wayland = true;
    };

    desktopManager.xterm.enable = true;
  };
}
