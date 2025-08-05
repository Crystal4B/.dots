{
  pkgs,
  config,
  lib,
  ...
}:
{
  options = {
    modules.git.enable = lib.mkEnableOption "Enable git module";
  };

  config = lib.mkIf config.modules.git.enable {
    programs.git = {
      enable = true;
      extraConfig = {
        pull.rebase = true;
      };

      includes = [
        {
          path = "/home/msek/.config/git/user.gitconfig";
        }
      ];
    };

    home.packages = with pkgs; [
      git
    ];
  };
}
