{ pkgs, ... }:
let
  username = (import ./../userconfig.nix).username;
in
{
  imports = [
    ./zsh.nix
    ./git.nix
    ./wezterm.nix
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
    wev
    htop
  ];

  programs.home-manager.enable = true;
  home.stateVersion = "23.11";
}
