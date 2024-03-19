{nixtheplanet, ...}: {
  services.macos-ventura = {
    enable = true;
    package = nixtheplanet.legacyPackages.x86_64-linux.makeDarwinImage {
      diskSizeBytes = 120000000000; # 120GB
    };
    openFirewall = true;
    vncListenAddr = "0.0.0.0";
  };
}
