{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nodejs
    yarn
    bun
    typescript
    typescript-language-server
  ];
}
