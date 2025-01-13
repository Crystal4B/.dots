{
  pkgs,
  config,
  lib,
  ...
}:
{
  options = {
    modules.feh.enable = lib.mkEnableOption "Enable feh module";
  };

  config = lib.mkIf config.modules.feh.enable {
    environment.systemPackages = with pkgs; [
      feh
    ];
  };
}
