{ pkgs, lib, config, ... }:
let
  my_emacs = pkgs.emacsWithPackagesFromUsePackage {
      config = ../../../config/emacs/.config/emacs/config.org;
      defaultInitFile = true;
      alwaysTangle = true;
      alwaysEnsure = true;
      package = pkgs.emacs;
      extraEmacsPackages = epkgs: [
        epkgs.treesit-grammars.with-all-grammars
        epkgs.f
        epkgs.s
        epkgs.lv
        epkgs.tablist
        epkgs.pcre2el
        epkgs.with-editor
        epkgs.hl-todo
        epkgs.hydra
        epkgs.mathjax
        epkgs.llama
        epkgs.elisp-refs
        epkgs.magit-section
        epkgs.transient
        epkgs.compat
        epkgs.seq
        epkgs.popup
        epkgs.shrink-path
        epkgs.emacsql
      ];
  };
in
{
  home.packages =
    with pkgs;
    []
    ++ mkLinuxOnly [
      emacs-lsp-booster
    ];

    programs.emacs = {
        enable = true;
        package = my_emacs;
    };
}
