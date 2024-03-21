{nixtheplanet, ...}: {
  services.macos-ventura = {
    enable = true;
    package = nixtheplanet.legacyPackages.x86_64-linux.makeDarwinImage {
      diskSizeBytes = 120000000000; # 120GB
    };
    cores = 8;
    threads = 16;
    mem = "16G";
    openFirewall = true;
    vncListenAddr = "0.0.0.0";
    autoStart = false;
    stateless = false;
  };
}
