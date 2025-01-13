{
  pkgs,
  config,
  lib,
  ...
}:
{
  options = {
    modules.gimp.enable = lib.mkEnableOption "Enable gimp module";
  };

  config = lib.mkIf config.modules.gimp.enable {
    environment.systemPackages = with pkgs; [
      gimp
    ];
  };
}
