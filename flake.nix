{
  description = "Dots NixOS and Home Manager setup";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    textfox.url = "github:adriankarlen/textfox";

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { nixpkgs, home-manager, ... }@inputs:
    {
      nixosConfigurations = {
        perun = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          system = "x86_64-linux";
          modules = [
            ./hosts/perun/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.extraSpecialArgs = {
                inherit inputs;
              };
            }
          ];
        };
      };

      homeConfigurations = {
        msek = home-manager.lib.homeManagerConfiguration {
          extraSpecialArgs = { inherit inputs; };
          pkgs = import nixpkgs { system = "x86_64-linux"; };
          modules = [
            ./users/msek/home.nix
          ];
        };
      };
    };
}
