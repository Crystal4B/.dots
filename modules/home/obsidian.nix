{
  pkgs,
  config,
  lib,
  ...
}:
{
  options = {
    modules.obsidian.enable = lib.mkEnableOption "Enable obsidian module";
  };

  config = lib.mkIf config.modules.obsidian.enable {
    home.packages = with pkgs; [
      obsidian
    ];
  };
}
