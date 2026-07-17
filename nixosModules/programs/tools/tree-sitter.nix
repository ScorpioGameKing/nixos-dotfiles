{ lib, config, ... }: {

  options = {
    tree-sitter.enable = lib.mkEnableOption "enables tree-sitter";
  };
  
  config = lib.mkIf config.tree-sitter.enable {
    environment.systemPackages = with pkgs; [
      tree-sitter
    ];
  };
}