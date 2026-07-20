{ pkgs, lib, config, ... }: {

  options = { };

  config = lib.mkIf config.nixos-modules.system.appimage.enable {
    programs.appimage.enable = true;
    programs.appimage.binfmt = true;
  };
}