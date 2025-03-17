{pkgs, ... }:
{
  services.emacs.package = pkgs.emacs-unstable;

  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = "https://github.com/nix-community/emacs-overlay/archive/master.tar.gz";
      sha256 = "sha256:00iamzsj9ddpdkmkqksbfc4j3iyksvqxllp01r5gfy6i1l9kh675";
    }))
  ];
}
