{
  pkgs,
  config,
  lib,
  ...
}:
{
  options = {
    modules.krita.enable = lib.mkEnableOption "Enable krita module";
  };

  config = lib.mkIf config.modules.krita.enable {
    home.packages = with pkgs; [
      krita
    ];
  };
}
