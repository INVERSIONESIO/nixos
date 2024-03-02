{
  pkgsx,
  pkgs,
  ...
}: {
  programs.nest-cli = {
    enable = true;
    enableZshIntegration = true;
  };

  home.packages = with pkgs; [
    npm-check-updates # (ncu) Find newer versions of package dependencies and check outdated npm packages locally or globally.
    nodePackages.pnpm
    pkgsx.npkill # remove node_modules from child directories
    nodejs_21
  ];
}
