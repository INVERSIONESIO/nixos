{
  description = "A very basic flake";

  inputs = {
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    grub-themes.url = "github:luisnquin/grub-themes";
    hyprland-contrib.url = "github:hyprwm/contrib";
    scripts.url = "github:luisnquin/scripts";
    hyprland.url = "github:hyprwm/Hyprland";
    nixpkgs.url = "nixpkgs/nixos-unstable";
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
          {
            resolution = "1920x1080";
            position = "0x0";
            scale = "1";
          }
          # { resolution = "highres"; position = "1920x0"; scale = "1"; }
          # { resolution = "1600x900"; position = "0x0"; scale = "1"; }
        ];
      };

      user = {
        fullName = "Guest user";
        alias = "guest";
      };

      specialArgs =
        {
          grub-pkgs = grub-themes.packages.${system};
          pkgsx = import ./pkgs {inherit pkgs;};

          inherit (hyprland.packages.${system}) hyprland xdg-desktop-portal-hyprland;
          inherit pkgs host user;
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
          ./home/options
          ./home/home.nix
        ];
      };
    };
}
