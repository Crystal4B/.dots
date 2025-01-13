{
  config,
  lib,
  ...
}:
{
  options = {
    modules.tmux.enable = lib.mkEnableOption "Enable tmux module";
  };

  config = lib.mkIf config.modules.tmux.enable {
    programs.tmux.enable = true;

    home.file.".config/tmux" = {
      source = ../../dotfiles/linux/.config/tmux;
    };
  };
}
