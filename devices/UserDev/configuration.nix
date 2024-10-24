{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [ ./substituters.nix ];
  boot.loader = {
    efi = {
      efiSysMountPoint = "/boot";
      canTouchEfiVariables = true;
    };
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      extraEntries = ''
        menuentry "NixOS - Pentesting" {
          search --no-floppy --set=root --label BOOT-PT
          configfile /grub/grub.cfg
        }
      '';
    };
  };

  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Kolkata";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # DisplayManager

  services.displayManager = {
    sddm.enable = true;
    defaultSession = "plasma";
  };

  # Desktop

  services.xserver.desktopManager = {
    plasma5.enable = true;
  };

  # Libinput

  services.libinput = {
    enable = true;
    touchpad.tapping = true;
  };

  # XServer
  services.xserver = {
    enable = true;
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

  # Sound
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

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

  # Light Control
  hardware.brillo.enable = true;

  # Firmware
  hardware.enableAllFirmware = true;

  # System Packages
  environment.systemPackages = with pkgs; [
    vim
    wget
    curl
    zsh
    wireshark
    cachix
    gns3-server
    ubridge
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
  programs.wireshark.enable = true;

  #Groups
  users.groups.ubridge = { };

  #Security Wrappers
  security.wrappers.ubridge = {
    source = "/run/current-system/sw/bin/ubridge";
    capabilities = "cap_net_admin,cap_net_raw=ep";
    owner = "root";
    group = "ubridge";
    permissions = "u+rx,g+rx,o+rx";
  };

  # Firewall
  networking.firewall.allowedTCPPortRanges = [
    {
      from = 1714;
      to = 1764;
    } # KDE Connect
  ];
  networking.firewall.allowedUDPPortRanges = [
    {
      from = 1714;
      to = 1764;
    } # KDE Connect
  ];
  networking.firewall.enable = true;
  networking.wireguard.enable = true;

  # NixPkgs
  nixpkgs.config.allowUnfree = true;

  # Nix Features
  nix = {
    package = pkgs.nix;
    settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  # Paths
  environment.pathsToLink = [ "/share/zsh" ];

  system.stateVersion = "24.05"; # DO NOT TOUCH
}
