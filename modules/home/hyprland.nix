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
      source = ../../dotfiles/linux/.config/hypr;
    };
    home.file.".config/waybar" = {
      source = ../../dotfiles/linux/.config/waybar;
    };
  };
}
