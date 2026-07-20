{ pkgs, lib, config, ... }: {
  config = lib.mkIf config.nixos-modules.users.scorpio.enable {
    users.users.scorpio= {
      isNormalUser = true;
      extraGroups = [ "wheel" ];
      packages = with pkgs; [
        tree
      ];
    };
  };
}