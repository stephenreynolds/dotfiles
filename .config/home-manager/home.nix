{pkgs, ...}: {
	home = {
		username = "stephen";
		homeDirectory = "/home/stephen";
		stateVersion = "23.05";
		packages = with pkgs; [
			btop
			cmake
			delta
			fd
			fish
			fzf
			gcc
			git
			lazygit
			neofetch
			neovim
			ninja
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
