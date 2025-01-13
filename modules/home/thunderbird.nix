{
  pkgs,
  config,
  lib,
  ...
}:
{
  options = {
    modules.thunderbird.enable = lib.mkEnableOption "Enable Thunderbird module";
  };

  config = lib.mkIf config.modules.thunderbird.enable {
    home.packages = with pkgs; [
      thunderbird
    ];
  };
}
