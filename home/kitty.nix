{
  programs.kitty = {
    enable = true;
    font.name = "JetBrainsMono Nerd Font";
    shellIntegration.enableZshIntegration = true;
    extraConfig = "
      hide_window_decorations yes
    ";
  };
}
