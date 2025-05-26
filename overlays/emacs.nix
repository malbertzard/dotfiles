{pkgs, ... }:
{
  services.emacs.package = pkgs.emacs-unstable;

  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = "https://github.com/nix-community/emacs-overlay/archive/master.tar.gz";
      sha256 = "sha256:0z966k8yai7l8sdvfyi05rn6z4cmxnxz0gx6g72dl6jmdg2f87cx";
    }))
  ];
}
