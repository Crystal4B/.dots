{
  pkgs,
  config,
  lib,
  ...
}:
{
  options = {
    modules.dolphin.enable = lib.mkEnableOption "Enable dolphin module";
  };

  config = lib.mkIf config.modules.dolphin.enable {
    environment.systemPackages = with pkgs; [
      dolphin
    ];
  };
}
