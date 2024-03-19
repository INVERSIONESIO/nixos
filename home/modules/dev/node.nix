{
  config,
  pkgsx,
  pkgs,
  ...
}: {
  programs.nest-cli = {
    enable = true;
    enableZshIntegration = true;
  };

  home = {
    file.".npmrc".text = ''
      prefix=${config.home.homeDirectory}/.npm-global
    '';

    sessionPath = ["$HOME/.npm-global/bin"];

    packages = with pkgs; [
      npm-check-updates # (ncu) Find newer versions of package dependencies and check outdated npm packages locally or globally.
      nodePackages.pnpm
      # pkgsx.npkill # remove node_modules from child directories
      nodejs_18
    ];
  };
}
