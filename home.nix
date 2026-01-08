{ pkgs, ... }: {
	imports = [
		./git.nix
		./packages.nix
		./alacritty.nix
	];

	home.stateVersion = "25.11";
	home.username = "bisheshankc.aryal";
	home.homeDirectory = "/Users/bisheshankc.aryal/";
	programs.home-manager.enable = true;
}
