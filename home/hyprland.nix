{ ... }:
let
  terminal = "kitty";
  fileManager = "yazi";
  menu = "wofi --show drun";
  mainMod = "SUPER";
in
{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    settings = {
      monitor = ",preferred,auto,1";
      exec-once = "";
      env = [
        "XCURSOR_SIZE,24"
        "QT_QPA_PLATFORMTHEME,qt5ct"
      ];
      input = {
        kb_layout = "us";
        kb_options = "ctrl:nocaps";
        follow_mouse = 1;
        touchpad.natural_scroll = "no";
        sensitivity = 0;
      };
      general = {
        gaps_in = 5;
        gaps_out = 5;
        border_size = 2;
        "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        "col.inactive_border" = "rgba(595959aa)";
        layout = "dwindle";
        allow_tearing = false;
      };
      decoration = {
        rounding = 5;
        active_opacity = 0.8;
        inactive_opacity = 0.6;
        fullscreen_opacity = 1.0;
        blur = {
          enabled = true;
          size = 8;
          passes = 3;
          xray = true;
          ignore_opacity = true;
        };
        drop_shadow = "yes";
        shadow_range = 4;
        shadow_render_power = 3;
        "col.shadow" = "rgba(1a1a1aee)";
      };
      animations = {
        enabled = "true";
        bezier = "myBezier,0.05,0.9,0.1,1.05";
        animation = [
          "windows,1,7,myBezier"
          "windowsOut,1,7,default,popin 80%"
          "border,1,10,default"
          "borderangle,1,8,default"
          "fade,1,7,default"
          "workspaces,1,6,default"
        ];
      };
      dwindle = {
        pseudotile = "yes";
        preserve_split = "yes";
        no_gaps_when_only = 1;
      };
      master = {
        new_is_master = true;
      };
      gestures = {
        workspace_swipe = "off";
      };
      misc = {
        force_default_wallpaper = 0;
      };
      windowrulev2 = "suppressevent maximize, class:.*";
      bind = [
        "${mainMod}, RETURN, exec, ${terminal}"
        "${mainMod}, Q, killactive"
        "${mainMod} SHIFT, E, exit"
        "${mainMod}, F, fullscreen"
        "${mainMod}, E, exec, ${fileManager}"
        "${mainMod}, V, togglefloating"
        "${mainMod}, M, exec, ${menu}"
        "${mainMod}, P, pseudo"
        "${mainMod}, S, togglesplit"
        "${mainMod}, H, movefocus, l"
        "${mainMod}, L, movefocus, r"
        "${mainMod}, K, movefocus, u"
        "${mainMod}, J, movefocus, d"
        "${mainMod} SHIFT, H, movewindow, l"
        "${mainMod} SHIFT, J, movewindow, d"
        "${mainMod} SHIFT, K, movewindow, u"
        "${mainMod} SHIFT, L, movewindow, r"
        "${mainMod} ALT, H, resizeactive, -10 0"
        "${mainMod} ALT, J, resizeactive, 0 10"
        "${mainMod} ALT, K, resizeactive, 0 -10"
        "${mainMod} ALT, L, resizeactive, 10 0"
        "${mainMod}, 1, workspace, 1"
        "${mainMod}, 2, workspace, 2"
        "${mainMod}, 3, workspace, 3"
        "${mainMod}, 4, workspace, 4"
        "${mainMod}, 5, workspace, 5"
        "${mainMod}, 6, workspace, 6"
        "${mainMod}, 7, workspace, 7"
        "${mainMod}, 8, workspace, 8"
        "${mainMod}, 9, workspace, 9"
        "${mainMod}, 0, workspace, 10"
        "${mainMod} SHIFT, 1, movetoworkspace, 1"
        "${mainMod} SHIFT, 2, movetoworkspace, 2"
        "${mainMod} SHIFT, 3, movetoworkspace, 3"
        "${mainMod} SHIFT, 4, movetoworkspace, 4"
        "${mainMod} SHIFT, 5, movetoworkspace, 5"
        "${mainMod} SHIFT, 6, movetoworkspace, 6"
        "${mainMod} SHIFT, 7, movetoworkspace, 7"
        "${mainMod} SHIFT, 8, movetoworkspace, 8"
        "${mainMod} SHIFT, 9, movetoworkspace, 9"
        "${mainMod} SHIFT, 0, movetoworkspace, 10"
        "${mainMod}, mouse_down, workspace, e+1"
        "${mainMod}, mouse_up, workspace, e-1"
      ];
      bindm = [
        "${mainMod}, mouse:272, movewindow"
        "${mainMod}, mouse:273, resizewindow"
      ];
    };
  };
}
