{
  pkgs,
  inputs,
  config,
  lib,
  ...
}:
{
  options = {
    modules.work-vpn.enable = lib.mkEnableOption "Enable work-vpn module";
  };

  config = lib.mkIf config.modules.work-vpn.enable {
    home.packages = with pkgs; [
      remmina
      networkmanagerapplet
      inputs.openconnect-sso.packages."${system}".openconnect-sso
    ];
  };
}
