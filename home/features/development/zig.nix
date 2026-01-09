{ pkgs, ... }:
let
in
{
  home.packages = with pkgs; [
  zig			
  zls			
  ];
}
