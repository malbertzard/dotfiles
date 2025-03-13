{ pkgs, lib, config, ... }:
let
  my_emacs = pkgs.emacsWithPackagesFromUsePackage {
      config = ../../../config/emacs/.config/emacs/config.org;
      defaultInitFile = true;
      alwaysTangle = true;
      alwaysEnsure = true;
      package = pkgs.emacs;
      extraEmacsPackages = epkgs: [
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
      ];
  };
in
{
    programs.emacs = {
        enable = true;
        package = my_emacs;
    };
}
