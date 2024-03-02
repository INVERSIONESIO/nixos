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

      specialArgs =
        {
          grub-pkgs = grub-themes.packages.${system};
          pkgsx = import ./pkgs {inherit pkgs;};

          inherit (hyprland.packages.${system}) hyprland xdg-desktop-portal-hyprland;
          inherit pkgs;
        }
        // hyprland-contrib.packages.${system}
        // scripts.packages.${system};
    in {
      nixosConfigurations."nixos" = nixpkgs.lib.nixosSystem {
        inherit (pkgs) system;
        inherit specialArgs;

        modules = [
          ./system/configuration.nix
        ];
      };

      homeConfigurations."guest" = home-manager.lib.homeManagerConfiguration {
        extraSpecialArgs = specialArgs;
        inherit pkgs;

        modules = [
          ./home/home.nix
        ];
      };
    };
}
