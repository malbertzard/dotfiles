{pkgs, ... }:
{
  services.emacs.package = pkgs.emacs-unstable;

  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = "https://github.com/nix-community/emacs-overlay/archive/master.tar.gz";
      sha256 = "sha256:07nkzgca0dxh18m664dvji2rn5phld4k8br2n9nc3s820kqjvm1z";
    }))
  ];
}
