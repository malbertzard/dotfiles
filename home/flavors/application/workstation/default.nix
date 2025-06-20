{ pkgs, lib, ... }:
{
  imports = [
    ../../../features/application/emacs.nix
  ];

  home.packages =
    with pkgs;
    [
      spotify
      zotero
      obsidian
      dbeaver-bin
      insomnia
    ]
    ++ mkLinuxOnly [
    ];
}
