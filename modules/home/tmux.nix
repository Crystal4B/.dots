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
    # Hack fix for conflict with autogen config
    xdg.configFile."tmux/tmux.conf".enable = false;

    programs.tmux.enable = true;

    home.file.".config/tmux" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dots/dotfiles/linux/.config/tmux";
    };
  };
}
