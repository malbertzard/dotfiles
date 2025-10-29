{ config, pkgs, host, ... }:

let
  users = import ../../../users.nix;

  # Filtering function to check if groups exist
  ifGroupsExist = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;

in
{
  security = {
    sudo = {
      wheelNeedsPassword = false;
    };
  };

  users.users.${host.user} = {
    isNormalUser = true;
    extraGroups =
      [ "wheel" ]
      ++ ifGroupsExist [
        "docker"
        "networkmanager"
      ];
  };
}
