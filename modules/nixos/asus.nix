{
  pkgs,
  config,
  lib,
  ...
}:
{
  options = {
    modules.asus.enable = lib.mkEnableOption "Enable asus module";
  };

  config = lib.mkIf config.modules.asus.enable {
    environment.systemPackages = with pkgs; [
      asusctl
    ];
  };
}
