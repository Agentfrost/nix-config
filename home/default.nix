{
  config,
  inputs,
  pkgs,
  ...
}:
let
  username = (import ./../userconfig.nix).username;
in
{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./zsh.nix
    ./git.nix
    ./kitty.nix
    ./librewolf.nix
    ./defaultPrograms.nix
  ];

  home.username = username;
  home.homeDirectory = "/home/${username}";

  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    neovim
    nerdfonts
    gns3-gui
    trash-cli
    nixfmt-rfc-style
    prettierd
    shfmt
    tree
    webex
    calibre
    unzip
    protonvpn-gui
  ];

  xdg.configFile.nvim = {
  	source = ../neovim;
	recursive = true;
  };

  programs.home-manager.enable = true;
  home.stateVersion = "23.11";
}
