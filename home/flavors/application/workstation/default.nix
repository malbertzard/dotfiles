{ pkgs, lib, ... }:
{
  imports = [
    ../../../features/application/emacs.nix
    ../../../features/application/vscode.nix
    ../../../features/application/wezterm.nix
  ];

  home.packages =
    with pkgs;
    [
      spotify
      zotero
      obsidian
      dbeaver-bin
      insomnia
      firefox-bin
      blender
      orca-slicer
      signal-desktop
    ]
    ++ mkLinuxOnly [
    ];
}
