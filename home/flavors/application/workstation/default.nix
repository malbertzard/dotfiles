{ pkgs, lib, ... }:
{
  imports = [
  ];

  home.packages =
    with pkgs;
    [
	  libreoffice
      qemu
      spotify
      gimp
	  inkscape
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
	  caffeine-ng
    ];
}
