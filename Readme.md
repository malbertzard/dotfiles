# Dotfiles

## Nixos
Switch nixos for the hostname
```bash
sudo nixos-rebuild switch --flake .#hostname
```

## Home Manager
```bash
home-manager switch --flake .#username@hostname
```
