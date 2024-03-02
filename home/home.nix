{
  imports = [
    ./modules
  ];

  home = {
    homeDirectory = "/home/guest";
    username = "guest";
    stateVersion = "24.05";
  };

  news.display = "silent";
  xdg.enable = true;

  programs.home-manager.enable = true;
}
