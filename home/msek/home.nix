{ pkgs, ... }:
{
    imports = [
        ../../modules/home
    ];

    modules = {
        neovim.enable = true;
        yazi.enable = true;
    };

    home.username = "msek";
    home.homeDirectory = "/home/msek";
    home.sessionVariables = {
        EDITOR = "nvim";

        LANG = "pl_PL.UTF-8";
        LC_ALL = "pl_PL.UTF-8";
    };

    home.keyboard = {
        layout = "pl";
        variant = "programmers";
    };

    home.file.".config/nix".source = ../../dotfiles/linux/.config/nix;

    programs.home-manager.enable = true;

    home.stateVersion = "24.05";
}

