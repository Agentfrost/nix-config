{
  description = "Frost NixOS config";
  inputs = { 
    nixpkgs.url = "nixpkgs/nixos-22.11";
  };

  outputs = { self, nixpkgs }: 
    let
    device = "hp-office";
  hardware-config = builtins.concatStringsSep "/" [ "/boot/devices" device "hardware-configuration.nix"];
  in {
    nixosConfigurations = {
      user = nixpkgs.lib.nixosSystem {
	system = "x86_64-linux";
	modules = [ 
	  ./boot/configuration.nix 
	  (./. + hardware-config)
	  ./home
	];
      };
    };
  };
}
