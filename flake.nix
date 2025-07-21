{
  description = "Nix Dotsfiles with flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-24.11";
    home-manager-stable = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs-stable";
    };
  };

  outputs =
    {
      self,
      ...
    }@inputs:

    let
      hosts = import ./hosts.nix;

      mkHomeConfigurations =
        {
          host,
          nixpkgs,
          home-manager,
          modules ? [ ],
        }:
        home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs {
            system = host.arch;
            config = {
              allowUnfree = true;
            };
          };
          modules = [
            ./hosts/${host.dir}/home.nix
            ./overlays
            ./overlays/emacs.nix
          ] ++ modules;
        };

      mkNixOSConfigurations =
        {
          host,
          nixpkgs,
          nixos-hardware,
          home-manager,
          modules ? [ ],
          overlays ? [ ],
        }:
        nixpkgs.lib.nixosSystem {
          system = host.arch;
          modules = [
            ./hosts/${host.dir}/configuration.nix
            nixos-hardware.nixosModules.framework-13-7040-amd
            { nixpkgs.overlays = overlays; }
            ./overlays
            ./overlays/emacs.nix

            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.users."${host.user}" = import ./hosts/${host.dir}/home.nix;
            }
          ] ++ modules;
        };

    in

    {
      homeConfigurations."${hosts.debian.user}@${hosts.debian.hostname}" = mkHomeConfigurations {
        host = hosts.debian;
        nixpkgs = inputs.nixpkgs;
        home-manager = inputs.home-manager;
      };


      nixosConfigurations."${hosts.nixos.hostname}" = mkNixOSConfigurations {
        host = hosts.nixos;
        nixpkgs = inputs.nixpkgs;
        nixos-hardware = inputs.nixos-hardware;
        home-manager = inputs.home-manager;
      };

    };
}
