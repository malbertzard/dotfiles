{ pkgs, lib, ... }:
{
  home.packages =
    with pkgs;
    [
	  qmk
	  vial
    ]
    ++ mkLinuxOnly [
    ];
}
