{ pkgs, lib, ...}: {

  options = {
    terminals.enable = lib.mkEnableOption "enables terminals";
  };

  config = lib.mkIf config.terminals.enable {
    imports = [
      ./../programs/terminals/wezterm.nix
    ];
  };
}
