{ config, pkgs, ... }:

{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages =
    [ 
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
      pkgs.docker-client
      pkgs.duf
      pkgs.eza
      pkgs.fd
      pkgs.fira-code
      pkgs.fish
      pkgs.glow
      pkgs.gnupg
      pkgs.go_1_23
      pkgs.gopls
      pkgs.graphviz
      pkgs.helix
      pkgs.htop
      pkgs.httpie
      #pkgs.ipscan
      pkgs.jetbrains-mono
      #pkgs.k9s
      #pkgs.kubectl
      #pkgs.kubernetes-helm-wrapped
      pkgs.k6
      pkgs.monaspace
      pkgs.mosh
      pkgs.mtr
      pkgs.mysql
      pkgs.nodejs
      #pkgs.nerdctl
      pkgs.ollama
      pkgs.postgresql_16
      pkgs.pgcli
      pkgs.pgloader
      pkgs.pspg
      pkgs.ripgrep
      pkgs.rustup
      pkgs.rsync
      pkgs.sd
      pkgs.starship
      #pkgs.tree-sitter-grammar
      #pkgs.texlive.combined.scheme-full
      pkgs.tokei
      #pkgs.wezterm
      pkgs.yt-dlp
      pkgs.zoxide
    ];

  # Allow packages with non-free licenses.
  nixpkgs.config.allowUnfree = true;

  # Use a custom configuration.nix location.
  # $ darwin-rebuild switch -I darwin-config=$HOME/.config/darwin/configuration.nix
  environment.darwinConfig = "$HOME/.config/darwin/configuration.nix";

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  nix.package = pkgs.nix;

  # Create /etc/zshrc that loads the nix-darwin environment.
  programs.zsh.enable = true;  # default shell on catalina
  programs.fish.enable = true;

  # Enable fonts hardlinking.
  fonts.packages  = [ pkgs.fira-code pkgs.jetbrains-mono pkgs.monaspace ];

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}
