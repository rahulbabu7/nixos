{
  config,
  pkgs,
  lib,
  ...
}:

{
  programs.emacs = {
    enable = true;
    package = pkgs.emacs30-pgtk;
    extraPackages =
      epkgs: with epkgs; [
        vterm
        pdf-tools
        # xclip
      ];
  };

  home.packages = with pkgs; [
    git
    ripgrep
    fd
    (aspellWithDicts (
      dicts: with dicts; [
        en
        en-computers
        en-science
      ]
    ))
    nil
    pyright
    nodePackages.typescript-language-server
    nodePackages.bash-language-server
    nodePackages.vscode-langservers-extracted
    nodePackages.yaml-language-server
    nixpkgs-fmt
    black
    nodePackages.prettier
    shellcheck
    nodePackages.eslint
    imagemagick
    pandoc
    nodePackages.js-beautify
  ];

  # home.activation.installDoomEmacs = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
  #   if [ ! -x "$HOME/.emacs.d/bin/doom" ]; then
  #     echo "Installing Doom Emacs..."
  #     rm -rf "$HOME/.emacs.d"

  #     ${pkgs.git}/bin/git clone --depth 1 \
  #       https://github.com/doomemacs/doomemacs \
  #       "$HOME/.emacs.d"

  #     EMACS=${pkgs.emacs30-pgtk}/bin/emacs \
  #       "$HOME/.emacs.d/bin/doom" install --no-env --no-fonts
  #   fi
  # '';

  # Link to your existing Doom config in ~/Config
  home.file.".doom.d".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Config/doom/.config/doom";
}
