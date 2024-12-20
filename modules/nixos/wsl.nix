{ config, lib, ... }:
{
    options = {
       systems.wsl.enable = lib.mkEnableOption "Enable WSL"; 
    };

    config = lib.mkIf config.systems.wsl.enable {
        wsl = {
            enable = true;
            wslConf.automount.root = "/mnt";
            wslConf.interop.appendWindowsPath = false;
            wslConf.network.generateHosts = false;
            defaultUser = "msek";
            startMenuLaunchers = true;
        };
    };
}

