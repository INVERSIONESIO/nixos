{nixtheplanet, ...}: {
  services.macos-ventura = {
    enable = true;
    package = nixtheplanet.legacyPackages.x86_64-linux.makeDarwinImage {
      diskSizeBytes = 120000000000; # 120GB
    };
    cores = 4;
    threads = 8;
    mem = "12G";
    openFirewall = true;
    vncListenAddr = "0.0.0.0";
    autoStart = false;
    stateless = false;
  };
}
