{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    enableExtensionUpdateCheck = true;
    mutableExtensionsDir = true;
    enableUpdateCheck = true;
    package = pkgs.vscode;

    extensions = with pkgs.vscode-extensions; [
      christian-kohler.path-intellisense
      arrterian.nix-env-selector
      brettm12345.nixfmt-vscode
      ms-python.vscode-pylance
      mechatroner.rainbow-csv
      kamadorueda.alejandra
      usernamehw.errorlens
      jnoortheen.nix-ide
      redhat.vscode-yaml
      ms-python.python
      eamodio.gitlens
      bbenoist.nix
      golang.go
    ];
  };
}
