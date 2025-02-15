{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:nixos/nixos-hardware";
  };

  outputs = inputs@{ self, nixpkgs, nixos-hardware, ... }: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";  # This is your build system
      modules = [
        {
          nixpkgs.crossSystem = {
            config = "riscv64-unknown-linux-gnu";
            system = "riscv64-linux";
          };
        }
        "${nixos-hardware}/starfive/visionfive/v2/sd-image-installer.nix"
        ./configuration.nix
      ];
    };
  };
}
