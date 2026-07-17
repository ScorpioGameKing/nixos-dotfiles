{ pkgs, lib, config, ... }: {
  
  options = {
    equibop.enable = lib.mkEnableOption "enables equibop";
  };

  config = lib.mkIf config.equibop.enable {
    home.packages = with pkgs; [
      equibop
    ];
  };
}