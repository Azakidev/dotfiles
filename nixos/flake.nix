{
    description = "My nixOS config";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

        quickshell = {
              url = "git+https://git.outfoxxed.me/quickshell/quickshell";
              inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = {
        self,
        nixpkgs,
        ...
        } @ inputs:
    let
        systems = [
          "x86_64-linux"
        ];
        # This is a function that generates an attribute by calling a function you
        # pass to it, with each system as an argument
        forAllSystems = nixpkgs.lib.genAttrs systems;

        username = "zazag";
    in {
    nixosModules = import ./modules/nixos;

    nixosConfigurations = {
        zazalapbottom = nixpkgs.lib.nixosSystem {
            specialArgs = {
                inherit inputs;
                inherit username;
            };
                    
            modules = [ ./hosts/laptop/configuration.nix ];
        };
    };

    };
}
