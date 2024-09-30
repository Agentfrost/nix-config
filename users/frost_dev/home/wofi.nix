{ lib, ... }:
{
  programs.wofi = {
    enable = true;
    style = lib.fileContents ../external/wofi-theme.css;
  };
}
