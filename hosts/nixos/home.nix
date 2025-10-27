{ config, pkgs, host, ... }:
let
  users = import ../../users.nix;
in
{
  imports = [
    ../../home/flavors/desktop/minimal
    ../../home/flavors/application/development
    ../../home/flavors/application/workstation
  ];

  home = {
    username = host.user;
    homeDirectory = "/home/${users.user}";
    stateVersion = "24.11";
    packages = with pkgs; [];
  };
}
