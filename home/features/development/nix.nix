{ pkgs, ... }:
let
in
{
  home.packages = with pkgs; [
	nixd			
  ];
}
