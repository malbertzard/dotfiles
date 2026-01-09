{ pkgs, lib, ... }:
{
  imports = [
    ../../../features/application/emacs.nix
    ../../../features/application/vscode.nix
    ../../../features/application/wezterm.nix

    ../../../features/development/build.nix
    ../../../features/development/devops.nix

    ../../../features/development/perl/perl.nix
    ../../../features/development/lua.nix
    ../../../features/development/nodejs.nix
    ../../../features/development/python.nix
    ../../../features/development/go.nix
    ../../../features/development/zig.nix
    ../../../features/development/ruby.nix
    ../../../features/development/rust.nix
    ../../../features/development/godot.nix
    ../../../features/development/commonlisp.nix
  ];
  home.packages =
    with pkgs;
    [
      dbeaver-bin
      insomnia
    ]
    ++ mkLinuxOnly [
    ];
}
