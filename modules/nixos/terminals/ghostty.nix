{
  pkgs,
  config,
  lib,
  ...
}:
{
  options = {
    modules.ghostty.enable = lib.mkEnableOption "Enable ghostty module";
  };

  config = lib.mkIf config.modules.ghostty.enable {
    environment.systemPackages = with pkgs; [
      ghostty
    ];
  };
}
