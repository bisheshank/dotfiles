{ pkgs, ... }: {
	programs.git = {
		enable = true;
		settings = {
			user.name = "Bisheshank";
			user.email = "bisheshank@brown.edu";
		};
	};
}
