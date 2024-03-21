{pkgs, ...}: {
  virtualisation = {
    libvirtd = {
      enable = true;
      onBoot = "start";
      onShutdown = "suspend";
      qemu.runAsRoot = true;
    };

    virtualbox.host.enable = true;
  };

  environment.systemPackages = with pkgs; [
    virt-manager
    tigervnc
    qemu
  ];
}
