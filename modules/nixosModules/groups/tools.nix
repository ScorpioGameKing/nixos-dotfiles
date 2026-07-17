{ ... }: {
  imports = [
    ./../programs/tools/cmake.nix
    ./../programs/tools/gcc.nix
    ./../programs/tools/nodejs.nix
    ./../programs/tools/pinentry-all.nix
    ./../programs/tools/python3.nix
    ./../programs/tools/python314Packages-colorama.nix
    ./../programs/tools/python314Packages-raylib-python-cffi.nix
    ./../programs/tools/ripgrep.nix
    ./../programs/tools/tree-sitter.nix
    ./../programs/tools/wget.nix
  ];
}