{ pkgs, ... }:
let
in
{
  home.packages = with pkgs; [
    rustc
    cargo
    rust-analyzer
  ];
}
