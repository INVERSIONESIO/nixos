{user, ...}: {
  imports = [
    ./modules
  ];

  home = {
    homeDirectory = "/home/${user.alias}";
    username = user.alias;
    stateVersion = "24.05";
  };

  news.display = "silent";
  xdg.enable = true;

  programs.home-manager.enable = true;
}
