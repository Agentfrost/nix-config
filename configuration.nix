{ config, lib, pkgs, ... }:

{
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
    };
  };

  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Kolkata";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # X Server

  services.xserver = {
    enable = true;
    desktopManager = { plasma5.enable = true; };
    displayManager = {
      sddm.enable = true;
      defaultSession = "plasma";
    };
    libinput = {
      enable = true;
      touchpad.tapping = true;
    };
    xkb = {
      layout = "us";
      options = "ctrl:nocaps";
    };
  };

  # Exclude Packages
  environment.plasma5.excludePackages = with pkgs.libsForQt5; [
    plasma-browser-integration
    konsole
    oxygen
    ark
    elisa
    khelpcenter
    print-manager
  ];

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio = {
    enable = true;
    package = pkgs.pulseaudioFull;
    extraConfig = "load-module module-switch-on-connect";
  };

  services.pipewire.enable = false;

  # Enable Bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        Enable = "Source,Sink,Media,Socket";
        Experimental = true;
      };
    };
  };

  # Firmware
  hardware.enableAllFirmware = true;

  # System Packages
  environment.systemPackages = with pkgs; [
    vim
    wget
    curl
    kitty
    zsh
    gns3-server
    wireshark
  ];

  # Hypervisor
  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
      runAsRoot = true;
      swtpm.enable = true;
      ovmf = {
        enable = true;
        packages = [
          (pkgs.OVMF.override {
            secureBoot = true;
            tpmSupport = true;
          }).fd
        ];
      };
    };
  };

  # Podman
  virtualisation.containers.enable = true;
  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
    defaultNetwork.settings.dns_enabled = true;
  };

  # System Programs
  programs.dconf.enable = true;
  programs.virt-manager.enable = true;

  # Firewall
  networking.firewall.allowedTCPPorts = [ ];
  networking.firewall.allowedUDPPorts = [ ];
  networking.firewall.enable = true;

  # NixPkgs
  nixpkgs.config.allowUnfree = true;

  # Nix Features
  nix = {
    package = pkgs.nix;
    settings.experimental-features = [ "nix-command" "flakes" ];
  };

  # Paths
  environment.pathsToLink = [ "/share/zsh" ];

  system.stateVersion = "23.11"; # DO NOT TOUCH

}

