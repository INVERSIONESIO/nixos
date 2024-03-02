{pkgs ? import <nixpkgs> {}, ...}:
with pkgs.lib; let
  packages = {
    vimix-cursor-theme = ./vimix-cursor-theme.nix;
  };
in
  attrsets.mapAttrs (_name: packagePath: pkgs.callPackage packagePath {}) packages
