{
  pkgs,
  config,
  lib,
  ...
}:
{
  options = {
    modules.steam.enable = lib.mkEnableOption "Enable steam module";
  };

  config = lib.mkIf config.modules.steam.enable {
    programs.mangohud.enable = true;

    home.packages = with pkgs; [
      steam
      gamescope
      mangohud
    ];
  };
}
