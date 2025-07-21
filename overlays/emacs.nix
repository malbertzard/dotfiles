{pkgs, ... }:
{
  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = "https://github.com/nix-community/emacs-overlay/archive/master.tar.gz";
      sha256 = "sha256:101k1kb519f3qp5a1whr96k9qxlb1rfda714fkvwc4qscnffcl3r";
    }))
  ];
}
