{ pkgs, lib, config, ... }: {
  config = lib.mkIf config.nixos-modules.tools.tree-sitter.enable {
    environment.systemPackages = with pkgs; [
      tree-sitter
    ];
  };
}