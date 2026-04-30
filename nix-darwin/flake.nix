{
  description = "Laptop flake";

  inputs = {
    # NOTE: Use a specific commit with: nixpkgs.url = "github:NixOS/nixpkgs/91c9a64ce2a84e648d0cf9671274bb9c2fb9ba60";
    # nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable-small";
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    helix.url = "github:helix-editor/helix";
    helix.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, helix }:
  let

    helixPackage = helix.packages.aarch64-darwin.default;

    configuration = { pkgs, ... }: {
      # Packages installed in system profile
      # NOTE: Attribute overriding example: (pkgs.nodejs_23.overrideAttrs (old: { version = "23.6.0"; }))
      # NOTE: To search by name, run: nix-env -qaP | rg fish
      environment.systemPackages = [
        pkgs.aspell
        pkgs.aspellDicts.en
        pkgs.aspellDicts.en-computers
        pkgs.aspellDicts.en-science
        pkgs.gnupg
        pkgs.jd-diff-patch

        # Media tools
        pkgs.asciinema
        pkgs.audacity
        # pkgs.beets
        # pkgs.chromaprint
        pkgs.ffmpeg
        pkgs.flac
        pkgs.ghostscript
        pkgs.graphviz
        pkgs.imagemagick
        pkgs.poppler
        pkgs.poppler-utils
        pkgs.rsgain
        pkgs.transmission_4
        # pkgs.yt-dlp

        # SQL tools
        # pkgs.pgcli
        # pkgs.pspg
        pkgs.sleek
        # pkgs.sqlcheck
        pkgs.sqlfluff
        pkgs.sqruff

        # AI tools
        # pkgs.ccusage
        pkgs.charm
        pkgs.claude-code
        pkgs.ollama

        # Command-line tools
        pkgs.angle-grinder
        pkgs.bat
        pkgs.coreutils
        pkgs.dos2unix
        pkgs.duf
        pkgs.eza
        pkgs.fd
        pkgs.fish
        pkgs.fzf
        pkgs.gdu
        pkgs.glow
        pkgs.htop
        pkgs.lz4
        pkgs.nvd
        pkgs.rclone
        pkgs.ripgrep
        pkgs.sd
        pkgs.starship
        pkgs.unrar
        pkgs.qsv
        pkgs.yazi

        # Development tools
        helixPackage
        pkgs.binutils
        pkgs.delta
        pkgs.difftastic
        # pkgs.flow-control
        pkgs.httpie
        pkgs.jujutsu
        pkgs.just
        pkgs.k6
        pkgs.mtr
        pkgs.rsync
        pkgs.tokei

        # Go toolchain
        pkgs.delve
        pkgs.go
        pkgs.golangci-lint-langserver
        pkgs.golangci-lint
        pkgs.golines
        pkgs.gofumpt
        pkgs.gopls
        pkgs.gosec
        pkgs.govulncheck
        pkgs.go-tools

        # Python toolchain
        pkgs.poetry
        pkgs.python3
        pkgs.uv
        
        # Rust toolchain
        pkgs.cargo
        pkgs.cargo-binutils
        pkgs.clippy
        pkgs.inferno
        pkgs.rustc
        pkgs.rustfmt
        pkgs.rust-analyzer
        # pkgs.arm-none-eabi-binutils

        # Rust wasm tools
        pkgs.binaryen
        pkgs.wasm-bindgen-cli

        # Typescript toolchain
        pkgs.nodejs_24
        pkgs.oxfmt
        pkgs.oxlint
        pkgs.typescript-language-server

        # Zig development
        pkgs.zig
        pkgs.zoxide
      ];

      # Allow packages with non-free licenses.
      nixpkgs.config.allowUnfree = true;

      # Allow packages marked as broken.
      # nixpkgs.config.allowBroken = true;

      # Allow unsupported systems.
      nixpkgs.config.allowUnsupportedSystem = true;

      # Enable using flakes.
      nix.settings.experimental-features = "nix-command flakes";

      # Enable fish shell support.
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
    # NOTE: Rebuild the darwin flake with: darwin-rebuild build --flake .#simple
    darwinConfigurations."timishi-laptop" = nix-darwin.lib.darwinSystem {
      modules = [ configuration ];
    };
  };
}
