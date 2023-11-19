{ config, lib, pkgs, ... }:

{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = [];

  # Use a custom configuration.nix location.
  # $ darwin-rebuild switch -I darwin-config=$HOME/.config/nixpkgs/darwin/configuration.nix
  # environment.darwinConfig = "$HOME/.config/nixpkgs/darwin/configuration.nix";

  # Auto upgrade nix and the daemon service and set nix options.
  #nix.package = pkgs.nix; # default option
  services.nix-daemon.enable = true;
  nix.extraOptions = ''
    #system = aarch64-darwin # M1, set by default
    extra-platforms = aarch64-darwin x86_64-darwin # Allow M1 and Rosetta apps
    #experimental-features = nix-command flakes
    build-users-group = nixbld
    #auto-optimise-store = true
  '';

  # MacOS Settings.
  system = {
    defaults = {
      NSGlobalDomain = {
        AppleInterfaceStyleSwitchesAutomatically = true; # Switch between dark and light modes.
        AppleKeyboardUIMode = 3; # Full keyboard control (accessibility settings).
        AppleShowScrollBars = "Always"; # Always show scroll bars.
        InitialKeyRepeat = 15; # Delay before keys repeat.
        KeyRepeat = 2; # Key repeat speed.
        NSDocumentSaveNewDocumentsToCloud = false; # Don't save docs to iCloud.
        NSNavPanelExpandedStateForSaveMode = true; # Use the expanded save file dialog.
        NSNavPanelExpandedStateForSaveMode2 = true; # Use the expanded save file dialog (unsure of difference).
      };

      alf = {
        globalstate = 1; # Incoming firewall state, 0 = disabled, 1 = enabled, 2 = only essential services.
        stealthenabled = 1; # Drop pings.
      };

      dock = {
        autohide = true; # Autohide the dock.
        mru-spaces = false; # (Do not) Automatically rearange spaces based on most recent use.
      };

      finder = {
        AppleShowAllExtensions = true; # Show all file extensions.
        FXDefaultSearchScope = "SCcf"; # Finder search scope, "SCcf" = current folder.
        FXPreferredViewStyle = "Nlsv"; # Default view style. "icnv" = icons, "Nlsv" = list, "clmv" = column, "Flwv" = gallery.
        ShowPathbar = true; # Show the path breadcrumb at the bottom.
        ShowStatusBar = true; # Show the status bar.
      };

      loginwindow.GuestEnabled = false; # Guest account (disabled).

      trackpad = {
        ActuationStrength = 0; # Click strength 0 = silent, 1 = clicky.
        Clicking = true; # Enable tap to click.
        TrackpadRightClick = true; # Enable right click.
      };
    };

    keyboard = {
      enableKeyMapping = true; # Enable key re-mapping.
      remapCapsLockToControl = true; # Caps Lock is a control key.
    };
  };

  # Home Manager setup.
  imports = [ <home-manager/nix-darwin> ];
  #home-manager.useGlobalPkgs = true;

  # User setup.
  users.users.tim = {
    name = "tim";
    home = "/Users/tim";
  };

  home-manager.users.tim = {pkgs, ... }: {
    home.packages = [
      #pkgs.angle-grinder
      pkgs.aspell
      pkgs.aspellDicts.en
      pkgs.aspellDicts.en-computers
      pkgs.aspellDicts.en-science
      pkgs.bat
      pkgs.colima
      pkgs.coreutils
      pkgs.delta
      pkgs.delve
      pkgs.difftastic
      pkgs.docker
      pkgs.duf
      pkgs.eza
      pkgs.fd
      pkgs.fira-code
      pkgs.fish
      #pkgs.firefox-devedition-bin
      pkgs.glow
      pkgs.gnupg
      pkgs.go
      pkgs.gopls
      pkgs.helix
      pkgs.htop
      pkgs.httpie
      pkgs.jetbrains-mono
      #pkgs.k9s
      #pkgs.kubectl
      #pkgs.kubernetes-helm-wrapped
      pkgs.mosh
      #pkgs.mycli
      pkgs.nodejs
      #pkgs.nerdctl
      pkgs.pgcli
      pkgs.ripgrep
      pkgs.rustup
      pkgs.rsync
      pkgs.sd
      pkgs.starship
      pkgs.tokei
      #pkgs.valgrind
      #pkgs.wezterm
      pkgs.yabai
      pkgs.zoxide
    ];

    home.stateVersion = "22.05";

    programs.fish = {
      enable = true;
      plugins = [{
          name="foreign-env";
          src = pkgs.fetchFromGitHub {
              owner = "oh-my-fish";
              repo = "plugin-foreign-env";
              rev = "dddd9213272a0ab848d474d0cbde12ad034e65bc";
              #sha256 = "00xqlyl3lffc5l0viin1nyp819wf81fncqyz87jx8ljjdhilmgbs";
              sha256 = "er1KI2xSUtTlQd9jZl1AjqeArrfBxrgBLcw5OqinuAM=";
          };
      }];
      shellInit = ''
        # nix
        if test -e /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
            fenv source /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
        end
      '';
      interactiveShellInit = ''
        # Environment variables
        set RIPGREP_CONFIG_PATH /Users/tim/.config/ripgreprc

        # Rust: /Users/tim/.cargo/bin
        if test -d /Users/tim/.cargo/bin
          contains /Users/tim/.cargo/bin $PATH
          or set PATH /Users/tim/.cargo/bin $PATH
        end

        # Golang: /Users/tim/go/bin
        if test -d /Users/tim/go/bin
          contains /Users/tim/go/bin $PATH
          or set PATH /Users/tim/go/bin $PATH
        end

        # Yarn: /Users/tim/.yarn/bin
        if test -d /Users/tim/.yarn/bin
          contains /Users/tim/.yarn/bin $PATH
          or set PATH /Users/tim/.yarn/bin $PATH
        end

        # Enable vi mode
        fish_vi_key_bindings

        # starship
        eval (starship init fish)

        # editor
        set EDITOR hx
      '';
      shellAliases = {
        "ls" = "eza -l --icons";
        "l" = "ls";
        "ll" = "ls -a";
        "cl" = "cd $argv and ls";
      };
    };

    programs.starship = {
      enable = true;
      enableFishIntegration = true;
      settings = {
        format = lib.concatStrings [
        "[](#33658A)"
        "$username"
        "[](bg:#06969A fg:#33658A)"
        "$directory"
        "[](bg:#86BBD8 fg:#06969A )"
        "$git_branch"
        "$git_status"
        "[](bg:#FCA17D fg:#86BBD8 )"
        "$docker_context"
        "[](bg:#DA627D fg:#FCA17D )"
        "$nix_shell"
        "[](bg:#9A348E fg:#DA627D)"
        "[](fg:#9A348E)"
        "$line_break"
        "$character"
        ];

        # Enable the blank line at the start of the prompt
        add_newline = true;

        # Disable command durations and set the starship timeout
        cmd_duration.disabled = true;
        scan_timeout = 10;

        # You can also replace your username with a neat symbol like   or disable this
        # and use the os module below
        username.show_always = true;
        username.style_user = "fg:#101116 bg:#33658A";
        username.style_root = "fg:#101116 bg:#33658A";
        username.format = ''[$user ]($style)'';
        username.disabled = false;

        directory.style = "fg:#101116 bg:#06969A";
        directory.format = "[ $path ]($style)";
        directory.truncation_length = 3;
        directory.truncation_symbol = "…/";

        # Here is how you can shorten some long paths by text replacement
        # similar to mapped_locations in Oh My Posh:
        directory.substitutions."Documents" = " ";
        directory.substitutions."Downloads" = " ";
        directory.substitutions."Music" = " ";
        directory.substitutions."Pictures" = " ";

        git_branch.symbol = "";
        git_branch.style = "fg:#101116 bg:#86BBD8";
        git_branch.format = ''[ $symbol $branch ]($style)'';

        git_status.style = "fg:#101116 bg:#86BBD8";
        git_status.format = ''[$all_status$ahead_behind ]($style)'';

        docker_context.symbol = " ";
        docker_context.style = "fg:#101116 bg:#FCA17D";
        docker_context.format = ''[ $symbol $context ]($style)'';

        nix_shell.symbol = "❄️ ";
        nix_shell.style = "fg:#101116 bg:#DA6270";
        nix_shell.format = ''[ $symbol $state: $name ]($style)'';
      };
    };

    programs.git = {
      enable = true;
      userName = "Tim Ousborne";
      userEmail = "dev@sourbone.net";
      extraConfig = {
        push.autoSetupRemote = true;
        init.defaultBranch = "main";
        merge.conflictStyle = "zdiff3";
        diff.algorithm = "histogram";
        alias.df = "diff --color-words";
      };
    };

    programs.helix = {
      enable = true;
      settings = {
        editor.auto-pairs = false;
        editor.lsp.display-messages = false;
        editor.soft-wrap.enable = true;
        #theme = "night_owl";
        #theme = "catppuccin_mocha";
        theme = "catppuccin_dark";
      };
    };
  };

  # Create /etc/bashrc that loads the nix-darwin environment.
  #programs.zsh.enable = true;  # default shell on catalina
  programs.fish.enable = true;
  environment.shells = [ pkgs.fish ];

  services.yabai = {
    enable = true;
    enableScriptingAddition = false;
    package = pkgs.yabai;
    config = {
      layout = "bsp";
      auto_balance = "on";
      split_ratio = "0.50";
      window_placement = "second_child";
      focus_follows_mouse = "autoraise";
      #window_shadow = "float";
      window_border = "off";
      window_topmost = "off";
    };
    extraConfig = ''
      yabai -m rule --add app='System Settings' manage=off
      yabai -m rule --add app='Activity Monitor' manage=off
    '';
  };

  services.skhd = {
    enable = true;
    package = pkgs.skhd;
    skhdConfig = ''
      # terminal
      cmd - return : /Applications/WezTerm.app/Contents/MacOs/wezterm-gui

      # focus
      shift + cmd - h : yabai -m window --focus west
      shift + cmd - l : yabai -m window --focus east

      # swap
      ctrl + cmd - h : yabai -m window --swap west
      ctrl + cmd - l : yabai -m window --swap east
    '';
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;

  # Delete old nix generations regularly (doesn't work on MacOS).
  nix.gc = {
    automatic = true;
    options = "--delete-older-than 3d";
  };
}
