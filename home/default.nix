{config, inputs, pkgs, ...}: let username = (import ./../config.nix).username; in {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
      ./zsh.nix
      ./git.nix
      ./kitty.nix
      ./librewolf.nix
      ./neovim.nix
      ./defaultPrograms.nix
  ];

  home.username = username;
  home.homeDirectory = "/home/${username}";

  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    nerdfonts
      gns3-gui
      trash-cli
  ];

  programs.home-manager.enable = true;
  home.stateVersion = "23.11";
								  }
