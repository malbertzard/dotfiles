{ pkgs, lib, ... }:
{
  imports = [
    ../../../features/development/build.nix

    ../../../features/development/lua.nix
    ../../../features/development/nodejs.nix
    ../../../features/development/python.nix
    ../../../features/development/go.nix
    ../../../features/development/rust.nix
    ../../../features/development/devops.nix
    ../../../features/development/android.nix
  ];
  home.packages =
    with pkgs;
    []
    ++ mkLinuxOnly [
    ];
}
