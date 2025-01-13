{
  pkgs,
  config,
  lib,
  ...
}:
{
  options = {
    modules.tmux.enable = lib.mkEnableOption "Enable tmux module";
  };

  config = lib.mkIf config.modules.tmux.enable {
    environment.systemPackages = with pkgs; [
      tmux
    ];
  };
}
