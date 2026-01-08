{ pkgs, ... }: {
	home.packages = with pkgs; [
		fzf 
		bat
		ripgrep
		fd
		tree
		gh
		tmux
		htop
		wget
		curl
		go
		rustup
		nodejs
	];
}
