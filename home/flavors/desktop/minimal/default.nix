{ pkgs, lib, ... }:
{
  imports = [
    ../../minimal
    ../../../features/fonts
  ];

  home.packages =
    with pkgs;
    mkLinuxOnly [
    ];
}
