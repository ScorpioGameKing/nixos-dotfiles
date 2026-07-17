{ lib, config, inputs, ... }: 

{

  options = {
    niri-configs.enable = lib.mkEnableOption "enables niri-configs";
  };
  
  config = lib.mkIf config.niri-configs.enable {
    xdg.configFile.niri = {
      source = create_symlink "${niri-dotfiles-repo}/.config/niri";
      recursive = true;
    };
  };
}