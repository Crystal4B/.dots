{
  pkgs,
  config,
  lib,
  ...
}:
{
  options = {
    modules.bitwarden.enable = lib.mkEnableOption "Enable Bitwarden module";
  };

  config = lib.mkIf config.modules.bitwarden.enable {
    home.packages = with pkgs; [
      bitwarden-desktop
      bitwarden-cli
    ];
  };
}
