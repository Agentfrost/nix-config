{ pkgs, inputs, ... }:
let
  username = (import ./../userconfig.nix).username;
in
{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./zsh.nix
    ./git.nix
    ./nixvim.nix
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
    xclip
    vscode-langservers-extracted
    zint
    signal-desktop
    traceroute
    libreoffice
    inkscape
    stremio
    chromium
    vlc
    openconnect
  ];

  programs.home-manager.enable = true;
  home.stateVersion = "23.11";
}
