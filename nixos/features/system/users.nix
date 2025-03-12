{ config, pkgs, ... }:

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

  users.users.${users.default} = {
    isNormalUser = true;
    extraGroups =
      [ "wheel" ]
      ++ ifGroupsExist [
        "docker"
        "networkmanager"
      ];
  };
}
