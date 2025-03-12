{ pkgs, lib, ... }:
{
  imports = [
    ../../features/cli/bat.nix
    ../../features/cli/common.nix
    ../../features/cli/fzf.nix
    ../../features/cli/jq.nix
    ../../features/cli/ripgrep.nix
    ../../features/cli/home-manager.nix

    ../../features/cli/gh.nix
  ];
  manual.html.enable = true;
}
