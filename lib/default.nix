{inputs}: let
  inherit (inputs.nixpkgs) legacyPackages;
in rec {
  mkCopilotChat = {system}: let
    inherit (pkgs) vimUtils;
    inherit (vimUtils) buildVimPlugin;
    pkgs = legacyPackages.${system};
  in
    buildVimPlugin {
      name = "CopilotChat";
      src = inputs.copilotchat;
    };

  mkVimPlugin = {system}: let
    inherit (pkgs) vimUtils;
    inherit (vimUtils) buildVimPlugin;
    pkgs = legacyPackages.${system};
  in
    buildVimPlugin {
      name = "doyeon";
      postInstall = ''
        rm -rf $out/.envrc
        rm -rf $out/.gitignore
        rm -rf $out/LICENSE
        rm -rf $out/README.md
        rm -rf $out/flake.lock
        rm -rf $out/flake.nix
        rm -rf $out/justfile
        rm -rf $out/lib
      '';
      src = ../.;
    };

  mkNeovimPlugins = {system}: let
    inherit (pkgs) vimPlugins;
    CopilotChat-nvim = mkCopilotChat {inherit system;};
    pkgs = legacyPackages.${system};
    doyeon-nvim = mkVimPlugin {inherit system;};
  in [
    # telescope
    vimPlugins.plenary-nvim
    vimPlugins.telescope-nvim

    # theme
    vimPlugins.tokyonight-nvim

    # extras
    vimPlugins.noice-nvim
    vimPlugins.nui-nvim
    vimPlugins.nvim-notify

    # configuration
    doyeon-nvim
  ];

  mkExtraPackages = {system}: let
    inherit (pkgs) nodePackages ocamlPackages python3Packages;
    pkgs = import inputs.nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
  in [
    # language servers
    pkgs.alejandra
  ];

  mkExtraConfig = ''
    lua << EOF
      require 'doyeon'.init()
    EOF
  '';

  mkNeovim = {system}: let
    inherit (pkgs) lib neovim;
    extraPackages = mkExtraPackages {inherit system;};
    pkgs = legacyPackages.${system};
    start = mkNeovimPlugins {inherit system;};
  in
    neovim.override {
      configure = {
        customRC = mkExtraConfig;
        packages.main = {inherit start;};
      };
      extraMakeWrapperArgs = ''--suffix PATH : "${lib.makeBinPath extraPackages}"'';
    };

  mkHomeManager = {system}: let
    extraConfig = mkExtraConfig;
    extraPackages = mkExtraPackages {inherit system;};
    plugins = mkNeovimPlugins {inherit system;};
  in {
    inherit extraConfig extraPackages plugins;
    defaultEditor = true;
    enable = true;
  };
}
