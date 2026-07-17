{ lib, config, ...}: {

  options = {
    tools.enable = lib.mkEnableOption "enables tools";
  };

  config = lib.mkIf config.tools.enable {
    imports = [
      ./../programs/tools/eza.nix
      ./../programs/tools/fzf.nix
      ./../programs/tools/gh.nix
      ./../programs/tools/git.nix
      ./../programs/tools/gpg.nix
      ./../programs/tools/nix-search-tv.nix
      ./../programs/tools/zoxide.nix
    ];
  };
}
