{
  pkgs,
  config,
  lib,
  ...
}:
{
  options = {
    modules.todoist.enable = lib.mkEnableOption "Enable todoist module";
  };

  config = lib.mkIf config.modules.todoist.enable {
    home.packages = with pkgs; [
      todoist-electron
    ];
  };
}
