{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;

  programs.git = {
    enable = true;
    config = {
      init = {
	defaultBranch = "main";
      };
      user = {
	username = "Agentfrost";
	email = "j.gaurav@proton.me";
      };
    };
  };

  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    ohMyZsh = {
      enable = true;
      theme = "gnzh";
    };
  };

  programs.neovim = {
    enable = true;
    configure = {
      customRC = ''
	set shiftwidth=2
      '';
    };
  };

  programs.wireshark = {
    enable = true;
    package = pkgs.wireshark;
  };

  programs.firefox = {
    enable = true;
    package = pkgs.wrapFirefox pkgs.firefox-esr-102-unwrapped {
      extraPolicies = {
	CaptivePortal = true;
	DisableFirefoxStudies = true;
	DisablePocket = true;
	DisableTelemetry = true;
	DisableFirefoxAccounts = true;
	NoDefaultBookmarks = true;
	OfferToSaveLogins = false;
	OfferToSaveLoginsDefault = false;
	PasswordManagerEnabled = false;
	EnableTrackingProtection = {
	  Value = true;
	  Locked = true;
	  Cryptomining = true;
	  Fingerprinting = true;
	  Exceptions = [];
	};
	ExtensionSettings = {
	  "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
	    installation_mode = "force_installed";
	    install_url = "https://addons.mozilla.org/firefox/downloads/file/4093799/bitwarden_password_manager-2023.3.1.xpi";
	  };
	  "jid1-ZAdIEUB7XOzOJw@jetpack" = {
	    installation_mode = "force_installed";
	    install_url = "https://addons.mozilla.org/firefox/downloads/file/4095879/duckduckgo_for_firefox-2023.4.11.xpi";
	  };
	};
	ExtentionUpdate = true;
	SearchEngines = {
	  Default = [ "DuckDuckGo" ];
	  Remove = [ "Google" "Bing" ];
	};
	FirefoxHome = {
	  Search = true;
	  Pocket = false;
	  SponsoredPocket = false;
	  Snippets = false;
	  TopSites = false;
	  SponsoredTopSites = false;
	  Highlights = false;
	};
	UserMessaging = {
	  ExtensionRecommendations = false;
	  SkipOnboarding = true;
	};
      };
    };
  };

  virtualisation.libvirtd.enable = true;
  programs.dconf.enable = true;

  users.users = {
    frost = {
      isNormalUser = true;
      createHome = true;
      extraGroups = ["wheel" "wireshark" "libvirtd"];
      group = "users";
      home = "/home/frost";
      shell = pkgs.zsh;
      packages = with pkgs; [ 
	alacritty 
	vscodium-fhs 
	kicad 
	distrobox 
	virt-manager 
	gparted
	htop
      ];
    };
  };
}
