{pkgs, ...}: {
	home = {
		username = "stephen";
		homeDirectory = "/home/stephen";
		stateVersion = "23.05";
		packages = with pkgs; [
			btop
			fd
			fish
			fzf
			git
			lazygit
			neovim
			nodejs
			ripgrep
			rustup
			silver-searcher
			starship
			tmux
			unzip
			zoxide
		];
	};

	programs = {
		home-manager.enable = true;
	};
}
