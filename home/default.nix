{ inputs, pkgs, ... }:
let
  username = (import ./../userconfig.nix).username;
in
{
  imports = [
    inputs.hyprland.homeManagerModules.default
    ./hyprland.nix
    ./wofi.nix
    ./zsh.nix
    ./git.nix
    ./kitty.nix
    ./helix.nix
    ./yazi.nix
    ./librewolf.nix
    ./defaultPrograms.nix
  ];

  home.username = username;
  home.homeDirectory = "/home/${username}";

  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    nerdfonts
    gns3-gui
    trash-cli
    nixfmt-rfc-style
    nil
    prettierd
    shfmt
    tree
    webex
    calibre
    unzip
    protonvpn-gui
    brillo
  ];

  programs.home-manager.enable = true;
  home.stateVersion = "23.11";
}
