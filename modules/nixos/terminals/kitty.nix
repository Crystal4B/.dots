{
  pkgs,
  config,
  lib,
  ...
}:
{
  options = {
    modules.kitty.enable = lib.mkEnableOption "Enable kitty module";
  };

  config = lib.mkIf config.modules.kitty.enable {
    environment.systemPackages = with pkgs; [
      kitty
    ];
  };
}
