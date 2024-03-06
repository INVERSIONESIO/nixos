{dotfilesDir, ...}: {
  environment.shellAliases = {
    tmp = "cd /tmp/";

    rm = "rm --interactive"; # safer
    du = "du --human-readable"; # simpler
    ls = "exa --icons"; # beauty
    ll = "exa -l"; # useful
    la = "exa -a"; # needed
    cat = "bat -p"; # common

    ".." = "cd ..";
    "..." = "cd ../..";
    "...." = "cd ../../..";
    "....." = "cd ../../../..";
    "......" = "cd ../../../../..";
    "~" = "cd /home/$USER/";

    lsd = "echo 'lsd? lol'";

    dud = "du --human-readable --summarize";
    open = "xdg-open";
    poff = "poweroff";
    py = "python3";
    tt = "ranger";

    sb = "cd ${dotfilesDir}/home/modules/desktop/wayland/hyprland/binds.nix";
    dot = "cd ${dotfilesDir}";
  };
}
