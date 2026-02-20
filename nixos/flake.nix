{
    description = "My nixOS config";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    };

    outputs = { self, nixpkgs }:
    let
        system = "x86_64-linux";

        pkgs = import nixpkgs {
            inherit system;

            config = {
                allowUnfree = true;
            };
        };
    in
    {

    nixosConfigurations = {
        zazalapbottom = nixpkgs.lib.nixosSystem {
            specialArgs = { inherit system; };
                    
            modules = [ 
            ./hosts/laptop.nix
            ./modules
            ];
        };
    };

    };
}
