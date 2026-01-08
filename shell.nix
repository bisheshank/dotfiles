{ pkgs, ... }: {
	home.shellAliases = {
		# List commands
		ll = "ls -al";

		# Git aliases
		g = "git";
		ga = "git add";
		gc = "git commit";
		gcm = "git commit -m";
		gpull = "git pull";
		gpush = "git push";
		gs = "git status";
		glt = "git log --all --decorate --oneline --graph";
		gpushsub = "git push --recurse-submodules=on-demand";

		# Directory navigation
		up = "cd ..";

		# Editor
		vim = "nvim";

		# Python
		py = "python3";
		py2 = "python2";

		# Better tools (using Nix packages)
		cat = "bat --paging=never -pp --theme=TwoDark";
		search = "nvim $(fzf -m --preview=\"cat {}\")";
	};

	programs.zsh = {
		initExtra = ''
			# mkcd function - make directory and cd into it
			mkcd() {
				mkdir -p "$1" && cd "$1"
			}

			# Generate dynamic 'cd ..' aliases
			generate_up_aliases() {
				local home_depth=$(echo "$HOME" | tr -cd '/' | wc -c)
				local current_depth=$(pwd | tr -cd '/' | wc -c)
				local max_depth=$((current_depth - home_depth))
				local alias_name=""
				local path=".."

				for ((i = 1; i <= max_depth; i++)); do
					alias_name+="."
					alias "$alias_name"="cd $path"
					path+="/.."
				done
			}

			# Generate aliases on shell start
			generate_up_aliases
		'';
	};
}
