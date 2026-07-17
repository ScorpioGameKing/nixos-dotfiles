{ pkgs, lib, config, ... }: {
  
  options = { };

  config = lib.mkIf config.tools.update-nix-fetchgit.enable {
    home.packages = with pkgs; [
      update-nix-fetchgit
    ];
  };
}