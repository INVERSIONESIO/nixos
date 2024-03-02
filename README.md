# [NixOS](https://nixos.org/)

## Expectations

### Have a fast setup that any organization collaborator can install in their computer

Even if they come from other operating systems they can have a very stable workstation with all the tools installed
to start developing.

### Solve the pain of versioned software development tools

In software development we use tools that might not always work in all projects, in this case
we would solve this by using [dev shell](https://fasterthanli.me/series/building-a-rust-service-with-nix/part-10) + [direnv](https://direnv.net/) in each local project. This is completely agnostic for
developers who don't share the same thoughts or operating system.

An excellent example of this is [nvm](https://github.com/nvm-sh/nvm), which is a tool that works well, but the idea
here is to forget the specific version that each project we are working on uses. This would be delegated to a single
maintenance operation instead of a pain that is present *n times* in every developer's  day.

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

## Where to search more packages and options

- [Search nix packages](https://search.nixos.org/packages)
- [Search NixOS options](https://search.nixos.org/options)
- [Search home manager options](https://mipmip.github.io/home-manager-option-search)


## How to update a flake input

Each flake entry has a fixed (time-lined) version of itself declared in [flake.lock](./flake.lock),
this ensures reproducibility on the used flakes, but you will need to periodically update the
entries for each third-party flake. To achieve this you just have to run this:

```sh
# You can press <tab> to autocomplete the input names.
$ nix flake lock --update-input <input-name>
```

This will update the specified input in the [flake.lock](./flake.lock) file but now
is in you to update your [NixOS](./system) and [Home manager](./home) setup and
check that everything's working as expected.

## Throubleshooting

 - [Wireless connection instantly fails on startup when just switched from Windows](https://wireless.wiki.kernel.org/en/users/drivers/iwlwifi#about_dual-boot_with_windows_and_fast-boot_enabled).

## License

[MIT](./.github/LICENSE)