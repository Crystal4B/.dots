{
  pkgs,
  config,
  lib,
  ...
}:
{
  options = {
    modules.drawing.enable = lib.mkEnableOption "Enable drawing module";
  };

  config = lib.mkIf config.modules.drawing.enable {
    hardware.opentabletdriver = {
      enable = true;
      daemon.enable = true;
    };
  };
}
