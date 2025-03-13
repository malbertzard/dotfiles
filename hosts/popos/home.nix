{ config, pkgs, ... }:
let
  users = import ../../users.nix;
in
{
  imports = [
    ../../overlays/emacs.nix
    ../../home/features/application/emacs.nix

    ../../home/flavors/desktop/minimal
    ../../home/features/application/emacs.nix
    ../../home/flavors/application/development
    ../../home/flavors/application/workstation
  ];

  home = {
    username = users.default;
    homeDirectory = "/home/${users.default}";
    stateVersion = "24.11";
    packages = with pkgs; [
    ];
  };
}
