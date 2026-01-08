{
	inputs = {
		nixpkgs.url = "github:NixOs/nixpkgs/nixos-unstable";
		home-manager.url = "github:nix-community/home-manager";
	};

	outputs = { nixpkgs, home-manager, ...}: {
		homeConfigurations.default = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.aarch64-darwin;
        modules = [ ./home.nix ];
		};
	};
}
