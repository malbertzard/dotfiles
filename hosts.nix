let
  users = import ./users.nix;
in
{
  popos = {
    hostname = "pop-os";
    dir = "popos";
    arch = "x86_64-linux";
    user = users.default;
  };

  nixos = {
    hostname = "nixos";
    dir = "nixos";
    arch = "x86_64-linux";
    user = users.default;
  };

  debian = {
    hostname = "debian";
    dir = "debian";
    arch = "x86_64-linux";
    user = users.default;
  };
}
