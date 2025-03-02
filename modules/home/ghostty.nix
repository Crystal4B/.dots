{
  pkgs,
  config,
  lib,
  ...
}:
{
  options = {
    modules.ghostty.enable = lib.mkEnableOption "Enable Ghostty module";
  };

  config = lib.mkIf config.modules.ghostty.enable {
    home.packages = with pkgs; [
      ghostty
    ];

    home.file.".config/ghostty" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dots/dotfiles/linux/.config/ghostty";
    };
  };
}
