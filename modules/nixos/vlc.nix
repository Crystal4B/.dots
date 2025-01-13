{
  pkgs,
  config,
  lib,
  ...
}:
{
  options = {
    modules.vlc.enable = lib.mkEnableOption "Enable vlc module";
  };

  config = lib.mkIf config.modules.vlc.enable {
    environment.systemPackages = with pkgs; [
      vlc
    ];
  };
}
