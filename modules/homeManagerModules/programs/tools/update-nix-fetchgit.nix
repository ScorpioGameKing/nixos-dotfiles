{ pkgs, lib, config, ... }: {
  config = lib.mkIf config.hm-modules.tools.update-nix-fetchgit.enable {
    home.packages = with pkgs; [
      update-nix-fetchgit
    ];
  };
}