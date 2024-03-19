{
  pkgs,
  senv,
  ...
}: {
  home.packages = [
    senv # switch .env files
    pkgs.rnix-lsp
  ];
}
