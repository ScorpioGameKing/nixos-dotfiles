{ pkgs, lib, config, ...  }: {

  options = { };

  config = lib.mkIf config.hm-modules.system.hm-settings.enable {
      home.username = "scorpio";
      home.homeDirectory = "/home/scorpio";
      home.stateVersion = "26.05";
  };
}