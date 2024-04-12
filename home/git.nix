{ config, ... }:
let identity = (import ./../userconfig.nix).git;
in {
  programs.git = {
    enable = true;
    userName = identity.username;
    userEmail = identity.email;
    extraConfig = { init.defaultBranch = "main"; };
  };
}
