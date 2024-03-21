{pkgs, ...}: {
  home.packages = with pkgs; [
    alejandra
    rnix-lsp
  ];
}
