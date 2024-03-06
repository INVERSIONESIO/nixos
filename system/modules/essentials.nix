{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    stdenv_32bit
    coreutils
    libsecret
    binutils
    openssh
    openssl
    gparted
    cmake
    lsof
    nmap
    wget
    dig
    eza # ls command replacement
    vlc

    ntfs3g
    exfat

    p7zip
    unzip
    unar
    zip
  ];
}
