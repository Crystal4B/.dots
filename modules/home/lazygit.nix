{
  pkgs,
  config,
  lib,
  ...
}:
{
  options = {
    modules.lazygit.enable = lib.mkEnableOption "Enable lazygit module";
  };

  config = lib.mkIf (config.modules.lazygit.enable && config.modules.git.enable) {
    home.packages = with pkgs; [
      lazygit
    ];
  };
}
