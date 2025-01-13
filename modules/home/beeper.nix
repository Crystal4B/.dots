{
  pkgs,
  config,
  lib,
  ...
}:
{
  options = {
    modules.beeper.enable = lib.mkEnableOption "Enable beeper module";
  };

  config = lib.mkIf config.modules.beeper.enable {
    home.packages = with pkgs; [
      beeper
    ];
  };
}
