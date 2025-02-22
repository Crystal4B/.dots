{
  inputs,
  pkgs,
  config,
  lib,
  ...
}:
{
  imports = [
    inputs.spicetify-nix.homeManagerModules.default
  ];

  options = {
    modules.spotify.enable = lib.mkEnableOption "Enable spotify module";
  };

  config = lib.mkIf config.modules.spotify.enable {
    programs.spicetify =
      let
        spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
      in
      {
        enable = true;
        enabledExtensions = with spicePkgs.extensions; [
          shuffle
          adblock
        ];
      };
  };
}
