{ pkgs, lib, ...}: {
  imports = [
    ./../programs/tools/eza.nix
    ./../programs/tools/fastfetch.nix
    ./../programs/tools/fuzzel.nix
    ./../programs/tools/fzf.nix
    ./../programs/tools/gh.nix
    ./../programs/tools/git.nix
    ./../programs/tools/gpg.nix
    ./../programs/tools/nix-search-tv.nix
    ./../programs/tools/update-nix-fetchgit.nix
    ./../programs/tools/zoxide.nix
  ];
}
