{ pkgs, lib, ... }:
{
  home.packages =
    with pkgs;
    [
      htop
      coreutils
      file
      restic
      wget
      inetutils
      tcpdump
      nmap
      iftop
      pstree
      tree
      ncdu
      pwgen
      git
      neovim
      screen
    ]
    ++ mkLinuxOnly [
      parted
      bottom
    ];
}
