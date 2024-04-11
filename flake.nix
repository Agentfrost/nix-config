{
    description = "Frost's NixOS configuration";

    inputs = {
	nixpkgs.url = "nixpkgs/nixos-unstable";
	home-manager = {
		url = "github:nix-community/home-manager";
		inputs.nixpkgs.follows = "nixpkgs";
	};
    };

    outputs = { self, nixpkgs, home-manager }: let
	    hostname = "UserWork";
    system = "x86_64-linux";
    username = "frost";
    gitUserName = "Agentfrost";
    gitUserEmail = "j.gaurav@proton.me";
    pkgs = import nixpkgs {inherit system;};
    in {
	    nixosConfigurations = {
	    "UserWork" = nixpkgs.lib.nixosSystem {
	    	inherit system;
		modules = [
		./${hostname}/hardware-configuration.nix
		    ./configuration.nix
		    {
		    	users.users.${username} = {
				isNormalUser = true;
				extraGroups = [ "wheel"  "audio" "libvirtd" "wireshark"];
				shell = pkgs.zsh;
			};

			programs.zsh.enable = true;
		    }
		    home-manager.nixosModules.home-manager {
		    	home-manager.useGlobalPkgs = true;
			home-manager.useUserPackages = true;
			home-manager.users.${username} = (
				import ./home.nix {
					inherit pkgs username system gitUserName gitUserEmail;
				}
			);
		    }
		];
	    };
	};
    };
}
