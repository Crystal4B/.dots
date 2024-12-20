{ pkgs, config, lib, ... }:
{
    options = {
        modules.neovim.enable = lib.mkEnableOption "Enable Neovim module";
    };

    config = lib.mkIf config.modules.neovim.enable {
        programs.neovim = {
            enable = true;
            withNodeJs = true;
        };

        home.packages = with pkgs; [
            ripgrep
            fzf
            fd
            gcc
            gnumake
            lua
            python314
            unzip
            wget
            tree-sitter
        ];

        home.file.".config/nvim".source = ../../dotfiles/.config/nvim;
    };
}

