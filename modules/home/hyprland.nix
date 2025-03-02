{
  pkgs,
  config,
  lib,
  ...
}:
{
  options = {
    modules.hyprland.enable = lib.mkEnableOption "Enable hyprland module";
  };

  config = lib.mkIf config.modules.hyprland.enable {
    home.packages = with pkgs; [
      hyprland
      hyprcursor

      wofi
      waybar
      xwayland
      swww
      dunst
      networkmanagerapplet
    ];

    home.file.".config/hypr" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dots/dotfiles/linux/.config/hypr";
    };
    home.file.".config/waybar" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dots/dotfiles/linux/.config/waybar";
    };
    home.file."wallpapers" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dots/walls";
    };
  };
}
