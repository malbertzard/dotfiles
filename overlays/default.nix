{
  config,
  pkgs,
  lib,
  ...
}:
{
  nixpkgs.overlays = [
    (import ./pkgs.nix)
    (import ./emacs.nix)
  ];
}
