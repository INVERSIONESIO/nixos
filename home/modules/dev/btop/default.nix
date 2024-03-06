{pkgs, ...}: {
  home = {
    packages = [pkgs.btop];

    shellAliases = {
      top = "btop";
    };
  };

  xdg.configFile = {
    "btop/btop.conf".text = builtins.readFile ./dots/btop.conf;
    "btop/themes/custom.theme".text = builtins.readFile ./dots/themes/custom.theme;
  };
}
