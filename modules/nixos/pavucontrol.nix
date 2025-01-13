{
  pkgs,
  config,
  lib,
  ...
}:
{
  options = {
    modules.pavu.enable = lib.mkEnableOption "Enable pavucontrol module";
  };

  config = lib.mkIf config.modules.pavu.enable {
    environment.systemPackages = with pkgs; [
      pavucontrol
    ];
  };
}
