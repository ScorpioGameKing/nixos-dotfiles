{ pkgs, lib, config, ... }: {
  
  options = {
    update-nix-fetchgit.enable = lib.mkEnableOption "enables update-nix-fetchgit";
  };

  config = lib.mkIf config.update-nix-fetchgit.enable {
    home.packages = with pkgs; [
      update-nix-fetchgit
    ];
  };
}