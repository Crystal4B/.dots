{
  pkgs,
  config,
  lib,
  ...
}:
{
  options = {
    modules.mullvad-vpn.enable = lib.mkEnableOption "Enable mullvad vpn module";
  };

  config = lib.mkIf config.modules.mullvad-vpn.enable {
    home.packages = with pkgs; [
      mullvad-vpn
    ];
  };
}
