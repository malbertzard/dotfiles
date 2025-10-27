{ pkgs, lib, ... }:
{
  imports = [
  ];

  home.packages =
    with pkgs;
    [
      spotify
      krita
      zotero
      obsidian
      firefox-bin
      blender
      orca-slicer
      audacity
      signal-desktop
    ]
    ++ mkLinuxOnly [
    ];
}
