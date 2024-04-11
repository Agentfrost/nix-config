{pkgs, username, system, gitUserName, gitUserEmail, ...}: {

	home.username = username;
	home.homeDirectory = "/home/${username}";

	fonts.fontconfig.enable = true;

	home.packages = with pkgs; [
		nerdfonts
		gns3-gui
	];

	programs.zsh = {
		enable = true;
		enableCompletion = true;
		autosuggestion.enable = true;
		syntaxHighlighting.enable = true;
		initExtra = "source ~/.p10k.zsh";
		plugins = [
			{
				name = "powerlevel10k";
				src = pkgs.zsh-powerlevel10k;
				file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
			}
		];

		history.size = 1000;
	};

	programs.git = {
		enable = true;
		userName =  gitUserName;
		userEmail = gitUserEmail;
		extraConfig = {
			init.defaultBranch = "main";
		};
	};

	programs.lazygit.enable = true;

	programs.kitty = {
		enable = true;
		font.name = "JetBrainsMono Nerd Font";
		shellIntegration.enableZshIntegration = true;
		extraConfig = "
			hide_window_decorations yes
		";
	};

	programs.librewolf = {
		enable = true;
		settings = {
			"webgl.disabled" = true;
			"identity.fxaccounts.enabled" = true;
			"privacy.clearOnShutdown.history" = false;
			"privacy.clearOnShutdown.downloads" = false;
		};
	};

	home.stateVersion = "23.11";
	programs.home-manager.enable = true;
}
