{ config, pkgs, ... }:

let
  tmux-window-name = pkgs.tmuxPlugins.mkTmuxPlugin {
    pluginName = "tmux-window-name";
    version = "unstable-2023-05-26";
    src = pkgs.fetchFromGitHub {
      owner = "ofirgall";
      repo = "tmux-window-name";
      rev = "19b65efa8c37501799789194be2a99293e67c632";
      sha256 = "sha256-VHtnN9XyEv8Gbwq5bJuq8QS04opwDOTGzEcLREy6kBA=";
    };
  };

  tmux-transient-status = pkgs.tmuxPlugins.mkTmuxPlugin {
    pluginName = "tmux-transient-status";
    version = "unstable-2023-08-02";
    src = pkgs.fetchFromGitHub {
      owner = "thesast";
      repo = "tmux-transient-status";
      rev = "52bdd8e5630b326bbad7184d3abed5f74839d524";
      sha256 = "sha256-JlflO4CRksJt87m5NuE8abNtbdVOusXyFNxeHqqD1G4=";
    };
  };
in
{
  home.username = "stephen";
  home.homeDirectory = "/home/stephen";

  home.stateVersion = "23.05";

  home.packages = with pkgs; [
    wslu
    wl-clipboard
    gcc
    gnumake
    tree-sitter
    nodejs
    rustup
    silver-searcher
    fd
    unzip
    neofetch
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
    BROWSER = "wslview";
    PYENV_ROOT = "${config.xdg.dataHome}/pyenv";
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
      fish_add_path $HOME/.config/scripts
    '';
    plugins = with pkgs; [
      { name = "foreign-env"; src = fishPlugins.foreign-env.src; }
      { name = "fzf-fish"; src = fishPlugins.fzf-fish.src; }
    ];
    shellAbbrs = {
      e = "nvim";
      dots = "git --git-dir $HOME/.dotfiles --work-tree=$HOME";
      lazydots = "lazygit -g $HOME/.dotfiles -w $HOME";
    };
  };

  programs.starship = {
    enable = true;
    enableTransience = true;
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
      ocaml.format = "via [$symbol(\\($switch_indicator$switch_name\\) )]($style)";
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
  
  programs.pyenv = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
  };

  programs.btop = {
    enable = true;
    settings = {
      color_theme = "${config.xdg.configHome}/btop/themes/catppuccin_mocha.theme";
      theme_background = false;
    };
  };

  programs.fzf = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
    # Catppuccin mocha theme
    colors = {
        "bg+" = "#313244";
        bg = "#1e1e2e";
        spinner = "#f5e0dc";
        hl = "#f38ba8";
        fg = "#cdd6f4";
        header = "#f38ba8";
        info = "#cba6f7";
        pointer = "#f5e0dc";
        marker = "#f5e0dc";
        "fg+" = "#cdd6f4";
        prompt = "#cba6f7";
        "hl+" = "#f38ba8";
    };
    defaultCommand = "ag --ignore .git -g ''";
    defaultOptions = [ "--extended" ];
    fileWidgetCommand = "ag --hidden --ignore .git -g '' --ignore '.cache' --ignore '.dotfiles' --ignore '.local' --ignore '.mozilla'";
  };

  programs.go = {
    enable = true;
    goPath = "${config.xdg.dataHome}/go";
  };

  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
  };

  programs.ripgrep = {
    enable = true;
  };

  programs.lazygit = {
    enable = true;
    settings = {
      # Catppuccin mocha theme
      gui.theme = {
        lightTheme = false;
        activeBorderColor = [ "#a6e3a1" "bold" ];
        inactiveBorderColor = [ "#cdd6f4" ];
        optionsTextColor = [ "#89b4fa" ];
        selectedLineBgColor = [ "#313244" ];
        selectedRangeBgColor = [ "#313244"];
        cherryPickedCommitBgColor = [ "#94e2d5" ];
        cherryPickedCommitFgColor = [ "#89b4fa" ];
        unstagedChangesColor = [ "red" ];
      };
    };
  };

  programs.lsd = {
    enable = true;
    enableAliases = true;
  };

  programs.tmux = {
    enable = true;
    baseIndex = 1;
    disableConfirmationPrompt = true;
    escapeTime = 1;
    keyMode = "vi";
    mouse = true;
    newSession = true;
    prefix = "C-Space";
    terminal = "screen-256color";
    plugins = with pkgs; [
      {
        plugin = tmuxPlugins.resurrect;
        extraConfig = ''
          set -g @resurrect-strategy-vim "session"
          set -g @resurrect-strategy-nvim "session"
          set -g @resurrect-capture-pane-contents "on"
        '';
      }
      {
        plugin = tmuxPlugins.catppuccin;
        extraConfig = "set -g @catppuccin_flavour 'mocha'";
      }
      tmuxPlugins.vim-tmux-navigator
      tmuxPlugins.sensible
      tmuxPlugins.tmux-fzf
      tmux-window-name
      {
        plugin = tmux-transient-status;
        extraConfig = ''
          set -g @transient-status-delay '0.5'
          set -g @transient-status-stall '2.5'
        '';
      }
    ];
    extraConfig = ''
      set -ga terminal-overrides ",*256col*:Tc"

      bind r source-file ~/.config/tmux/tmux.conf

      bind -T copy-mode-vi v send-keys -X begin-selection
      bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel "wl-copy"

      # Select pane
      bind -r ^ last-window
      bind -r k select-pane -U
      bind -r j select-pane -D
      bind -r h select-pane -L
      bind -r l select-pane -R

      # Split window
      bind | split-window -h
      bind - split-window -v
      unbind '"'
      unbind %

      # Toggle between current and previous window
      set -g renumber-windows on
      bind c new-window -c "#{pane_current_path}"
      bind Space last-window

      bind T display-popup -E "tt"
      set-option -g detach-on-destroy off
    '';
  };

  programs.bat = {
    enable = true;
    config = {
      theme = "Catppuccin-mocha";
    };
    themes = {
      Catppuccin-mocha = builtins.readFile (pkgs.fetchFromGitHub {
        owner = "catppuccin";
        repo = "bat";
        rev = "ba4d16880d63e656acced2b7d4e034e4a93f74b1";
        sha256 = "sha256-6WVKQErGdaqb++oaXnY3i6/GuH2FhTgK0v4TN4Y0Wbw=";
      } + "/Catppuccin-mocha.tmTheme");
    };
  };
}
