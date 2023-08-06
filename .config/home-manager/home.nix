{ config, pkgs, ... }:

{
  home.username = "stephen";
  home.homeDirectory = "/home/stephen";

  home.stateVersion = "23.05"; # Please read the comment before changing.

  home.packages = with pkgs; [
    nodejs
    rustup
    go
    pyenv
    fzf
    zoxide
    ripgrep-all
    lazygit
    btop
    neofetch
    lsd
  ];

  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    delta = {
      enable = true;
      options = {
        navigate = true;
	side-by-side = true;
	line-number = true;
	features = "decorations interactive";
      };
    };
    lfs.enable = true;
    userEmail = "mail@stephenreynolds.dev";
    userName = "Stephen Reynolds";
    extraConfig = {
      core = {
        editor = "nvim";
	whitespace.tabwidth = 4;
      };
      color.ui = true;
      init.defaultBranch = "main";
      merge.conflictStyle = "diff3";
      pull.rebase = true;
      diff.colorMoved = "default";
      credential = {
        "https://dev.azure.com" = {
	  useHttpPath = true;
	};
	helper = "/mnt/c/Program\\ Files/Git/mingw64/bin/git-credential-manager.exe";
      };
    };
  };

  programs.fish = {
    enable =  true;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
    '';
    plugins = [
      { name = "foreign-env"; src = pkgs.fishPlugins.foreign-env.src; }
    ];
    shellAbbrs = {
      e = "nvim";
      dots = "git --git-dir $HOME/.dotfiles --work-tree=$HOME";
      lazydots = "lazygit -g $HOME/.dotfiles -w $HOME";
      ls = "lsd";
    };
  };

  programs.starship = {
    enable = true;
    settings = {
      add_newline = true;

      character.success_symbol = "[λ](bold green)";

      package.disabled = true;

      bun.format = "via [$symbol]($style)";
      buf.format = "via [$symbol]($style)";
      cmake.format = "via [$symbol]($style)";
      cobol.format = "via [$symbol]($style)";
      crystal.format = "via [$symbol]($style)";
      daml.format = "via [$symbol]($style)";
      dart.format = "via [$symbol]($style)";
      deno.format = "via [$symbol]($style)";
      dotnet.format = "[$symbol(🎯 $tfm )]($style)";
      elixir.format = "via [$symbol]($style)";
      elm.format = "via [$symbol]($style)";
      erlang.format = "via [$symbol]($style)";
      fennel.format = "via [$symbol]($style)";
      golang.format = "via [$symbol]($style)";
      gradle.format = "via [$symbol]($style)";
      haxe.format = "via [$symbol]($style)";
      helm.format = "via [$symbol]($style)";
      julia.format = "via [$symbol]($style)";
      kotlin.format = "via [$symbol]($style)";
      lua.format = "via [$symbol]($style)";
      meson.format = "via [$symbol]($style)";
      nim.format = "via [$symbol]($style)";
      nodejs.format = "via [$symbol]($style)";
      ocaml.format = "via [$symbol(($switch_indicator$switch_name) )]($style)";
      opa.format = "via [$symbol]($style)";
      perl.format = "via [$symbol]($style)";
      php.format = "via [$symbol]($style)";
      pulumi.format = "via [$symbol$stack]($style)";
      purescript.format = "via [$symbol]($style)";
      python.format = "via [$symbol]($style)";
      raku.format = "via [$symbol]($style)";
      red.format = "via [$symbol]($style)";
      rlang.format = "via [$symbol]($style)";
      ruby.format = "via [$symbol]($style)";
      rust.format = "via [$symbol]($style)";
      swift.format = "via [$symbol]($style)";
      vagrant.format = "via [$symbol]($style)";
      vlang.format = "via [$symbol]($style)";
      zig.format = "via [$symbol]($style)";

      palettes.catppuccin_mocha = {
        rosewater = "#f5e0dc";
	flamingo = "#f2cdcd";
	pink = "#f5c2e7";
	mauve = "#cba6f7";
	red = "#f38ba8";
	maroon = "#eba0ac";
	peach = "#fab387";
	yellow = "#f9e2af";
	green = "#a6e3a1";
	teal = "#94e2d5";
	sky = "#89dceb";
	sapphire = "#74c7ec";
	blue = "#89b4fa";
	lavender = "#b4befe";
	text = "#cdd6f4";
	subtext1 = "#bac2de";
	subtext0 = "#a6adc8";
	overlay2 = "#9399b2";
	overlay1 = "#7f849c";
	overlay0 = "#6c7086";
	surface2 = "#585b70";
	surface1 = "#45475a";
	surface0 = "#313244";
	base = "#1e1e2e";
	mantle = "#181825";
	crust = "#11111b";
      };

      palette = "catppuccin_mocha";
    };
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
    viAlias = true;
  };
}
