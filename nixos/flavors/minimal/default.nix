{ pkgs, ... }:
{
  imports = [
    ../../features/system/bootloader.nix
    ../../features/system/basic.nix
    ../../features/system/nix.nix
    ../../features/system/users.nix
  ];
}
