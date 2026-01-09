{ pkgs, ... }: {
	programs.tmux = {
		enable = true;
		shortcut = "space";
		baseIndex = 1;
		newSession = true;
		escapeTime = 0;
		secureSocket = false;

		settings = {
			# Mouse support
			mouse = "on";

			# Activity monitoring
			monitor-activity = "on";
			visual-activity = "on";

			# History limit
			history-limit = 5000;

			# Pane numbering
			pane-base-index = 1;

			# Renumber windows
			renumber-windows = "on";

			# Terminal settings
			default-terminal = "screen-256color";
		};

		extraConfig = ''
			# Reload config
			bind r source-file ~/.config/tmux/tmux.conf \; display "Reloaded!"

			# Split commands
			bind-key "|" split-window -h -c "#{pane_current_path}"
			bind-key "\\" split-window -fh -c "#{pane_current_path}"
			bind-key "-" split-window -v -c "#{pane_current_path}"
			bind-key "_" split-window -fv -c "#{pane_current_path}"

			# Swapping windows
			bind -r "{" swap-window -d -t -1
			bind -r "}" swap-window -d -t +1

			# Keep the current path when creating new things
			bind c new-window -c "#{pane_current_path}"

			# Toggling windows and session
			bind Space last-window
			bind-key C-Space switch-client -l

			# Resizing panes
			bind -r C-j resize-pane -D 15
			bind -r C-k resize-pane -U 15
			bind -r C-h resize-pane -L 15
			bind -r C-l resize-pane -R 15

			# Moving between panes with vim keys
			bind h select-pane -L
			bind j select-pane -D
			bind k select-pane -U
			bind l select-pane -R

			# Moving between windows with vim movement keys
			bind -r C-h select-window -t :-
			bind -r C-l select-window -t :+

			# Killing without confirming
			bind-key x kill-pane
			bind-key & kill-window
		'';
	};
}