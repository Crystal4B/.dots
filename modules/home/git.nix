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
      userName = "Marcin Sęk";
      userEmail = "marcin.j.sek@gmail.com";
      extraConfig = {
        pull.rebase = true;
      };
    };

    home.packages = with pkgs; [
      git
    ];
  };
}
