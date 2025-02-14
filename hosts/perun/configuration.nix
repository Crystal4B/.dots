{ pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos

    ../../users/msek/msek.nix
    ../../users/guest.nix
  ];

  modules = {
    nvidia.enable = true;
    pipewire.enable = true;
    bluetooth.enable = true;
    fonts.enable = true;

    hyprland.enable = true;
    dolphin.enable = true;
    zen.enable = true;
    zsh.enable = true;
    vlc.enable = true;
    pavu.enable = true;
    neovim.enable = true;

    yubikey.enable = true;

    ghostty.enable = true;
    tmux.enable = true;
    greetd.enable = true;
    gimp.enable = true;
    feh.enable = true;
  };

  boot.loader.grub = {
    enable = true;
    device = "nodev";
    useOSProber = true;
    efiSupport = true;
  };
  boot.loader.efi.canTouchEfiVariables = true;

  users.defaultUserShell = pkgs.zsh;

  networking.hostName = "perun";

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Berlin";

  i18n.defaultLocale = "en_IE.UTF-8";
  i18n.supportedLocales = [
    "en_IE.UTF-8/UTF-8"
    "pl_PL.UTF-8/UTF-8"
    "de_DE.UTF-8/UTF-8"
    "bg_BG.UTF-8/UTF-8"
  ];
  i18n.extraLocaleSettings = {
    LC_CTYPE = "en_IE.UTF-8";
    LC_NUMERIC = "en_IE.UTF-8";
    LC_TIME = "en_IE.UTF-8";
    LC_COLLATE = "en_IE.UTF-8";
    LC_MONETARY = "en_IE.UTF-8";
    LC_MESSAGES = "en_IE.UTF-8";
    LC_PAPER = "en_IE.UTF-8";
  };

  services.xserver.xkb = {
    layout = "ie";
  };

  console.keyMap = "ie";

  system.stateVersion = "25.05";
}
