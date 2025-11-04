{ config, pkgs, host, ... }:
{
  imports =
    [
      ./hardware-configuration.nix

      ../../nixos/features/hardware/bluetooth.nix
      ../../nixos/features/hardware/fprintd.nix
      ../../nixos/features/hardware/cups.nix
      ../../nixos/features/hardware/audio.nix

      ../../nixos/flavors/minimal
      ../../nixos/flavors/desktop/kde/default.nix
      ../../nixos/flavors/gaming/default.nix
      ../../nixos/flavors/virtualisation/default.nix
    ];

  networking.hostName = host.hostname; # Define your hostname.

  # boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelPackages = pkgs.linuxPackages_zen;

  system.stateVersion = "24.11"; # Did you read the comment?
}
