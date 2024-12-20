{
    description = "Simple NixOS and Home Manager setup";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

        nixos-wsl = {
            url = "github:nix-community/NixOS-WSL";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = { nixpkgs, nixos-wsl, home-manager, ... }: {
        nixosConfigurations.veles = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            modules = [
                ./hosts/veles/configuration.nix
                home-manager.nixosModules.home-manager
                nixos-wsl.nixosModules.wsl
            ];
        };
    };
}

