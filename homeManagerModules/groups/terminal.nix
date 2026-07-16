{ pkgs, lib, ...}: {
  imports = [
    ./../programs/bash.nix
    ./../programs/gpg.nix
    ./../programs/git.nix
    ./../programs/gh.nix
    ./../programs/eza.nix
    ./../programs/zoxide.nix
    ./../programs/fzf.nix
    ./../programs/television.nix
    ./../programs/oh-my-posh.nix
    ./../programs/nix-search-tv.nix
    ./../programs/lazygit.nix
    ./../programs/wezterm.nix
    ./../programs/yazi.nix
  ];
}
