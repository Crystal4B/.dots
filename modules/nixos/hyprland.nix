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
    environment.systemPackages = with pkgs; [
      hyprland

      wofi
      waybar
      xwayland
      swww
      dunst
      networkmanagerapplet
    ];

    services.displayManager = {
      sessionPackages = [ pkgs.hyprland ];
    };

    environment.sessionVariables = {
      WLR_NO_HARDWARE_CURSORS = "1";
      NIXOS_OZONE_WL = "1";
    };
  };
}
