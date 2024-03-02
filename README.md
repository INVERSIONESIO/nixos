# [NixOS](https://nixos.org/)

## Build a new generation

For both of the sections below you'll need to execute the showcased commands in the
same directory where the dotfiles were cloned.

### [NixOS configuration](https://github.com/NixOS/nixpkgs/tree/master/nixos/modules)

If you recently modified something from the [./system](./system) AKA NixOS configuration files
you'll need to use this command.

```sh
# Update system configuration without the need to reboot
$ sudo nixos-rebuild switch --upgrade --flake .

# The updated system configuration should be available on reboot
# You normally want this when you modify something at very low
# level on the computer
$ sudo nixos-rebuild boot --upgrade --flake .
```

### [Home manager](https://github.com/nix-community/home-manager/tree/master/modules)

Use this command if you modified something from the [./home](./home/) AKA home manager
configuration files.

```sh
# Update the configuration files, services and assets of the user home
# directory.
#
# As long that there's only a single user you'll be able to use this way.
$ home-manager switch --flake .
```

However, these settings are heavily embodied to Nix flakes, so the idea is that
when you update something in the [flake.nix](./flake.nix) or [flake.lock](./flake.lock)
files, you update the environments that you think will be affected by those changes.

## License

[MIT](./.github/LICENSE)