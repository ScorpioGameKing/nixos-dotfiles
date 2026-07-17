{ pkgs, lib, config, ... }: {
  
  options = { };

  config = lib.mkIf config.hm-modules.tools.eza.enable {
    home.packages = with pkgs; [
      eza
    ];
    programs.eza = {
      enable = true;
      enableBashIntegration = config.hm-modules.shells.bash.enable;
      enableNushellIntegration = config.hm-modules.shells.nushell.enable;
      icons = "auto";
    };
  };
}