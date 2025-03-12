{ pkgs, lib, config, ... }:
let
    my_emacs = pkgs.emacsWithPackagesFromUsePackage {
        config = ./init.el;
        defaultInitFile = true;
    };
in
{
    programs.emacs = {
        enable = true;
        package = my_emacs;
    };

    home.file.".emacs.d/init.el".source = ./init.el;
}
