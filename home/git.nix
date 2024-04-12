{config, ...}: let 
identity = (import ./../config.nix).git;
in {
  programs.git = {
    enable = true;
    userName = identity.username;
    userEmail = identity.email;
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}
