{ config, lib, ... }:
{
    options = {
        defaults.locale.enable = lib.mkEnableOption "Enable default locale";
    };

    config = lib.mkIf config.defaults.locale.enable {
        i18n.defaultLocale = "en_IE.UTF-8";

        services.xserver.xkb.layout = "ie";
        console.useXkbConfig = true;

        environment.variables = {
            LANG = "en_IE.UTF-8";
            LC_TIME = "en_IE.UTF-8";
        };
    };
}

