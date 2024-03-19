{pkgs, ...}: {
  home.packages = with pkgs; [
    sqlite-web # SQLite
    dbeaver
    pgweb # Postgres viewer
    sqlc # Builder
  ];
}
