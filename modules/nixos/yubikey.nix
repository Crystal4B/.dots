{
  pkgs,
  config,
  lib,
  ...
}:
{
  options = {
    modules.yubikey.enable = lib.mkEnableOption "Enable yubikey module";
  };

  config = lib.mkIf config.modules.yubikey.enable {
    environment.systemPackages = with pkgs; [
      yubikey-manager
    ];

    services.pcscd.enable = true;
    services.udev.packages = [ pkgs.yubikey-personalization ];

    programs.gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };
}
