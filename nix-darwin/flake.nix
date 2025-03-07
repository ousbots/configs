{
  description = "Laptop flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable-small";
    nix-darwin.url = "github:LnL7/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs }:
  let
    configuration = { pkgs, ... }: {
      # List packages installed in system profile. To search by name, run:
      # > nix-env -qaP | rg fish
      environment.systemPackages = [
        # Attribute overriding example: [
        # (pkgs.nodejs_23.overrideAttrs (old: { version = "23.6.0"; }))
        # pkgs.angle-grinder
        pkgs.aspell
        pkgs.aspellDicts.en
        pkgs.aspellDicts.en-computers
        pkgs.aspellDicts.en-science
        pkgs.audacity
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
        pkgs.fish
        pkgs.ffmpeg
        # pkgs.ghostty
        pkgs.glow
        pkgs.gnupg
        pkgs.go_1_24
        pkgs.golangci-lint-langserver
        pkgs.golangci-lint
        pkgs.gopls
        pkgs.gosec
        #pkgs.govulncheck
        #pkgs.go-tools
        pkgs.graphviz
        pkgs.helix
        pkgs.htop
        pkgs.httpie
        pkgs.jujutsu
        pkgs.just
        pkgs.k6
        pkgs.mtr
        pkgs.nodejs_23
        pkgs.ollama
        pkgs.pgcli
        pkgs.pspg
        pkgs.ripgrep
        pkgs.rustup
        pkgs.rsync
        pkgs.sd
        pkgs.sleek
        pkgs.sqlcheck
        pkgs.sqruff
        pkgs.starship
        pkgs.swift-format
        pkgs.tokei
        pkgs.unrar
        pkgs.yt-dlp
        pkgs.zoxide
      ];

      # Allow packages with non-free licenses.
      nixpkgs.config.allowUnfree = true;

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Enable alternative shell support in nix-darwin.
      programs.fish.enable = true;

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 6;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";

      # # HACK: Use custom launchd for Ollama
      # # Currently not available for nix-darin
      # # https://github.com/LnL7/nix-darwin/pull/972
      # launchd.user.agents.ollama = {
      #   path = [ config.environment.systemPath ];

      #   serviceConfig = {
      #     KeepAlive = true;
      #     RunAtLoad = true;
      #     ProgramArguments = [ "${pkgs.ollama}/bin/ollama" "serve" ];

      #     EnvironmentVariables = {
      #       OLLAMA_HOST = "127.0.0.1:11434";
      #     };
      #   };
      # };
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#simple
    darwinConfigurations."timishi-laptop" = nix-darwin.lib.darwinSystem {
      modules = [ configuration ];
    };
  };
}
