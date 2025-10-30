{ lib, stdenv, pkgs, perl526, buildPerlModule, ... }:

let
  perl526Packages = import <nixpkgs> {
    system = stdenv.hostPlatform.system;
  }.perlPackages.perl526;
in rec {
  ClamAVClient = buildPerlModule rec {
	name = "ClamAV-Client";
	version = "0.11";
    src = pkgs.fetchurl {
      url = "https://cpan.metacpan.org/authors/id/J/JM/JMEHNLE/clamav-client/ClamAV-Client-${version}.tar.gz";
      sha256 = "sha256-LPBWgRRddFJp1nEsWtQkoQ84FJQSP1aIhNlY0lfnUkY=";
    };
	meta = with lib; {
      description = "Client interface for the ClamAV clamd virus scanner daemon";
      homepage = "https://metacpan.org/dist/ClamAV-Client";
	};
  };
}
