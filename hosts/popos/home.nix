{ config, pkgs, ... }:
let
  users = import ../../users.nix;
in
{
  imports = [
    ../../home/flavors/desktop/minimal
    ../../home/flavors/application/development
    ../../home/flavors/application/workstation
    ../../home/flavors/application/gaming.nix

    ../../overlays/emacs.nix
    ../../home/features/application/emacs.nix
  ];

  home = {
    username = users.default;
    homeDirectory = "/home/${users.default}";
    stateVersion = "24.11";
    packages = with pkgs; [];
  };
}
