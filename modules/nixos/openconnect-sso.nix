{
  pkgs,
  inputs,
  config,
  lib,
  ...
}:
{
  options = {
    modules.opensso.enable = lib.mkEnableOption "Enable openconnect-sso module";
  };

  config = lib.mkIf config.modules.opensso.enable {
    environment.systemPackages = with pkgs; [
      inputs.openconnect-sso.packages."${system}".openconnect-sso
    ];
  };
}
