{ ... }:
{
  services.picom = {
    enable = true;
    backend = "glx";
    extraArgs = [ "--experimental-backends" ];
    activeOpacity = 0.9;
    inactiveOpacity = 0.8;
    settings = {
      corner-radius = 10;
      blur = {
        method = "dual_kawase";
        strength = 3;
        background = false;
        background-frame = false;
        background-fixed = false;
      };
    };
  };
}
