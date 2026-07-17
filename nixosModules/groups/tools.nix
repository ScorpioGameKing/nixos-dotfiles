{ ... }: {
  imports = [
    ./../tools/cmake.nix
    ./../tools/gcc.nix
    ./../tools/nodejs.nix
    ./../tools/pinentry-all.nix
    ./../tools/ripgrep.nix
    ./../tools/tree-sitter.nix
    ./../tools/wget.nix
  ];
}