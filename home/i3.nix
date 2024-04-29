{ config, lib, ... }:
{
  xsession.windowManager.i3 = {
    enable = true;
    config = {
      modifier = "Mod4";
      bars = [ ];
      window = {
        titlebar = false;
        border = 0;
      };
      gaps = {
        smartGaps = true;
        smartBorders = "no_gaps";
        inner = 10;
      };
      keybindings =
        let
          modifier = config.xsession.windowManager.i3.config.modifier;
        in
        lib.mkOptionDefault {
          "${modifier}+Shift+e" = ''exec i3-nagbar -t warning -m "Do you want to exit ?" -b "Yes" "xfce4-session-logout"'';
          "${modifier}+Shift+r" = "restart";
          "${modifier}+Return" = "exec kitty";
          "${modifier}+q" = "kill";
          "${modifier}+m" = "exec --no-startup-id rofi -show drun -modi drun -show-icons";
          "${modifier}+h" = "focus left";
          "${modifier}+j" = "focus down";
          "${modifier}+k" = "focus up";
          "${modifier}+l" = "focus right";
          "${modifier}+Shift+h" = "move left";
          "${modifier}+Shift+j" = "move down";
          "${modifier}+Shift+k" = "move up";
          "${modifier}+Shift+l" = "move right";
          "${modifier}+Shift+v" = "split h";
        };
    };
  };
}
