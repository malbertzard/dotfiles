{ pkgs, lib, ... }:
{
  imports = [];

  home.packages =
    with pkgs;
    [
      spotify
      zotero
      dbeaver-bin
    ]
    ++ mkLinuxOnly [
    ];
}
