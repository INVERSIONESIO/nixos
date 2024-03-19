{
  services = {
    gnome.gnome-keyring.enable = true;

    openssh = {
      enable = true;
      settings.PasswordAuthentication = true;
    };
  };

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
}
