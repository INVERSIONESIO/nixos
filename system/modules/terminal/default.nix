{
  pkgs,
  host,
  ...
}: {
  imports = [
    ./starship.nix
    ./aliases.nix
    ./zsh.nix
  ];

  console = {
    font = "Lat2-Terminus16";
    keyMap = "la-latin1";
  };

  environment = {
    interactiveShellInit = builtins.readFile (builtins.path {
      name = "${host.name}-system-shrc-script";
      path = ./dots/.shrc;
    });

    variables.EDITOR = "nano";

    shells = [pkgs.zsh];
  };
}
