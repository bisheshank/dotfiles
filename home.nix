{ pkgs, ... }: {
	home.stateVersion = "25.11";
	home.username = "bisheshankc.aryal";
	home.homeDirectory = "/Users/bisheshankc.aryal/";
	programs.home-manager.enable = true;

	home.packages = with pkgs; [
		git
		fzf
		bat
	];
}
