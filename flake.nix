{
  description = "Frost's NixOS configuration";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, nixvim, ... }@inputs:
    let
      configuration = (import ./userconfig.nix);
      pkgs = import nixpkgs { system = configuration.system; };
    in {
      nixosConfigurations = {
        ${configuration.hostname} = nixpkgs.lib.nixosSystem {
          system = configuration.system;
          modules = [
            ./${configuration.hostname}/hardware-configuration.nix
            { networking.hostName = configuration.hostname; }
            ./configuration.nix
            {
              users.users.${configuration.username} = {
                isNormalUser = true;
                extraGroups = [ "wheel" "audio" "libvirtd" "wireshark" ];
                shell = pkgs.zsh;
              };

              programs.zsh.enable = true;
            }
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = { inherit inputs; };
              home-manager.users.${configuration.username} = import ./home;
            }
          ];
        };
      };
    };
}
