{ pkgs, lib, config, ... }: {
  config = lib.mkIf config.nixos-modules.system.font.enable {
    fonts.packages = with pkgs; [
      nerd-fonts.agave
    ];
  };
}