{ pkgs, ... }:
{
  imports = [
    ../modules/nixos

    ../users/msek/msek.nix
    ../users/guest/guest.nix
  ];

  modules = {
    nvidia.enable = true;
    pipewire.enable = true;
    bluetooth.enable = true;
    fonts.enable = true;

    drawing.enable = true;

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
    tldr.enable = true;
  };

  # needed for theming
  programs.dconf.enable = true;

  # fix documentation
  documentation.man = {
    enable = true;
    generateCaches = true;
  };

  users.defaultUserShell = pkgs.zsh;

  nix = {
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];

      auto-optimise-store = true;
    };

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 10d";
    };
  };

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
}
