{ ... }: {

  options = {
    niri.enable = mkEnableOption "enables niri";
  };
  
  config = mkIf config.niri.enable {
    programs.niri = {
      enable = true;
    };
  };
}