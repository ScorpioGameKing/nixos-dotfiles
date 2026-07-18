{ pkgs, lib, config, ...  }: {

  options = { };

  config = lib.mkIf config.hm-modules.system.hm-settings.enable {
      home.username = config.hm-modules.system.hm-settings.username;
      home.homeDirectory = config.hm-modules.system.hm-settings.homeDirectory;
      home.stateVersion = "26.05";
  };
}