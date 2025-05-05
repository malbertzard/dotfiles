{ pkgs, ... }:
{
  home.packages = [
    pkgs.pyenv
    pkgs.pdm
    (pkgs.python3.withPackages (
      ps: with ps; [
        pyyaml
        requests
        tkinter
        virtualenv
      ]
    ))
  ];
  programs.pylint = {
    enable = true;
  };
}
