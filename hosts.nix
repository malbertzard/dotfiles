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
}
