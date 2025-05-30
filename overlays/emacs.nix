{pkgs, ... }:
{
  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = "https://github.com/nix-community/emacs-overlay/archive/master.tar.gz";
      sha256 = "sha256:19scipiyfvyscxy8x5yyxs0kc6jghjnqj3n7hv40c7k972jz82nx";
    }))
  ];
}
