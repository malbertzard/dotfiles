{ pkgs, lib, ... }:
{
  imports = [
  ];

  home.packages =
    with pkgs;
    [
      spotify
      gimp
      krita
      zotero
      obsidian
      firefox-bin
      chromium
      blender
      orca-slicer
      audacity
      signal-desktop
    ]
    ++ mkLinuxOnly [
    ];
}
