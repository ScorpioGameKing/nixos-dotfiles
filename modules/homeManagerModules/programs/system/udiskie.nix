{ pkgs, lib, config, ... }: {
  
  options = { };

  config = lib.mkIf config.hm-modules.system.udiskie.enable {
    programs.udiskie = {
      programs.udiskie.settings = {
        automount = true;
        notify = false;
      }
    };
  };
}