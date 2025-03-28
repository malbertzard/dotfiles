{ pkgs, lib, ... }:
{
  imports = [];

  home.packages =
    with pkgs;
    [spotify]
    ++ mkLinuxOnly [
    ];
}
