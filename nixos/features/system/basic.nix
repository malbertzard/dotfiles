{ config, pkgs, ... }:

{
  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "de";
    variant = "";
  };

  networking.networkmanager.enable = true;

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

  # coommon packages
  environment.systemPackages = with pkgs; [
    git
    vim
    curl
    dig
    neofetch
    htop
    iftop
    tcpdump
    inetutils
    bottom
    pstree
    tree
    pwgen
    screen
    ncdu
    parted
    file
    unzip
    lshw
  ];
}
