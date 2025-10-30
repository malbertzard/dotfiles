{ pkgs, stdenv, lib, fetchurl, ... }:

let
  pkgs1809 = import (builtins.fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/refs/tags/18.09.tar.gz";
    sha256 = "1ib96has10v5nr6bzf7v8kw7yzww8zanxgw2qi1ll1sbv6kj6zpd";
  }) {
    system = pkgs.stdenv.hostPlatform.system;
  };

  perl526 = pkgs1809.perl526;
  buildPerlModule = pkgs1809.perlPackages.buildPerlModule;
  perl526Packages = import ./perl526Packages.nix {
    inherit lib stdenv pkgs perl526 buildPerlModule;
  };
in
  {
	home.packages = [
      perl526
	];
  }
