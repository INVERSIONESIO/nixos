{
  description = "A very basic flake";

  inputs = {
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs_mysql_57.url = "github:NixOS/nixpkgs?rev=06c9198cbf48559191bf6c9b76c0f370f96b8c33";
    spicetify-nix.url = "github:the-argus/spicetify-nix";
    grub-themes.url = "github:luisnquin/grub-themes";
    hyprland-contrib.url = "github:hyprwm/contrib";
    scripts.url = "github:luisnquin/scripts";
    hyprland.url = "github:hyprwm/Hyprland";
    nixpkgs.url = "nixpkgs/nixos-unstable";
    senv.url = "github:luisnquin/senv";
    nao.url = "github:luisnquin/nao";
  };

  outputs = inputs:
    with inputs; let
      system = "x86_64-linux";

      pkgs = import nixpkgs {
        config = {
          allowBroken = false;
          allowUnfree = true;
        };

        inherit system;
      };

      host = {
        name = "nixos";

        monitors = [
          # { resolution = "1920x1080"; position = "0x0"; scale = "1"; }
          {
            resolution = "highres";
            position = "1920x0";
            scale = "1";
          }
          {
            resolution = "1600x900";
            position = "0x0";
            scale = "1";
          }
        ];
      };

      user = {
        fullName = "Guest user";
        alias = "guest";
      };

      dotfilesDir = "~/.dotfiles";

      specialArgs =
        {
          grub-pkgs = grub-themes.packages.${system};
          pkgsx = import ./pkgs {inherit pkgs;};

          mysql_57 = (import nixpkgs_mysql_57 {inherit system;}).mysql57;
          spicetify = spicetify-nix.packages.${pkgs.system}.default;
          senv = senv.defaultPackage.${system};

          inherit (hyprland.packages.${system}) hyprland xdg-desktop-portal-hyprland;
          inherit pkgs host user dotfilesDir;
        }
        // hyprland-contrib.packages.${system}
        // scripts.packages.${system};
    in {
      nixosConfigurations.${host.name} = nixpkgs.lib.nixosSystem {
        inherit (pkgs) system;
        inherit specialArgs;

        modules = [
          ./system/configuration.nix
        ];
      };

      homeConfigurations.${user.alias} = home-manager.lib.homeManagerConfiguration {
        extraSpecialArgs = specialArgs;
        inherit pkgs;

        modules = [
          nao.homeManagerModules.default
          spicetify-nix.homeManagerModule
          ./home/options
          ./home/home.nix
        ];
      };
    };
}
