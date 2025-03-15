{ pkgs, lib, ... }:
{
  imports = [
    ../../../../overlays/emacs.nix
    ../../../../home/features/application/emacs.nix
  ];

  home.packages =
    with pkgs;
    [
	spotify
	]
    ++ mkLinuxOnly [
    ];
}
