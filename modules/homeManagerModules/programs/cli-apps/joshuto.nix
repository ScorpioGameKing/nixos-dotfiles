{ pkgs, lib, config, inputs, ...  }: 

let
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  inherit (inputs) niri-dotfiles-repo;
in

{

  options = {
    joshuto.enable = lib.mkEnableOption "enables joshuto";
  };

  config = lib.mkIf config.joshuto.enable {

    home.packages = with pkgs; [
      joshuto
    ];
    
    programs.joshuto = {
      enable = true;
    };
  };
}