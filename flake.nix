{
  description = "NixOS configuration flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    neovim-nightly-overlay = {
      url = "github:nix-community/neovim-nightly-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { home-manager, nixpkgs, neovim-nightly-overlay, ... }:
    let
    system = "x86_64-linux";

  in {
    nixosConfigurations = {
      nixbox = nixpkgs.lib.nixosSystem {
	inherit system;
	modules = [
	  ./configuration.nix
	    ./config/packages.nix

	    { nix.registry.nixpkgs.flake = nixpkgs; }
	home-manager.nixosModules.home-manager {
	  home-manager.useGlobalPkgs = true;
	  home-manager.useUserPackages = true;
	  home-manager.users.fs = import ./config/home.nix;
	  nixpkgs.overlays = [
	    neovim-nightly-overlay.overlay
	  ];
	}
	];
      };
    };
  };
}
