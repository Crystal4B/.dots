{ config, ... }:
{
  imports = [
    ../common.nix

    ../../modules/home
  ];

  nixpkgs.config.allowUnfree = true;

  modules = {
    # TUI
    tmux.enable = true;
    neovim.enable = true;
    yazi.enable = true;
    lazygit.enable = true;
    git.enable = true;
    nushell.enable = true;

    # GUI
    spotify.enable = true;
    vesktop.enable = true;
    todoist.enable = true;
    steam.enable = true;
    ghostty.enable = true;
    hyprland.enable = true;
    thunderbird.enable = true;
    bitwarden.enable = true;
    mullvad-vpn.enable = true;
    work-vpn.enable = true;
    krita.enable = true;
    obsidian.enable = true;
  };

  home.username = "msek";
  home.homeDirectory = "/home/msek";
  home.sessionVariables = {
    EDITOR = "nvim";

    LANG = "de_DE.UTF-8";
    LC_ALL = "de_DE.UTF-8";
  };

  home.keyboard = {
    layout = "pl";
    variant = "programmers";
  };

  home.file.".config/nix".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dots/dotfiles/linux/.config/nix";

  programs.home-manager.enable = true;

  home.stateVersion = "25.05";
}
