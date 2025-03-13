{ pkgs, lib, ... }:
{
  home.packages =
    with pkgs;
    [
      neofetch
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
