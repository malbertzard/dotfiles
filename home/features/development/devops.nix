{ pkgs, ... }:
{
  home.packages = with pkgs; [
    ansible
    distrobox
  ];
}
