{ pkgs, lib, config, inputs, ...  }: 
let
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  inherit (inputs) niri-dotfiles-repo;
in
{
  config = lib.mkIf config.hm-modules.cli-apps.joshuto.enable {
    home.packages = with pkgs; [
      joshuto
    ];
    programs.joshuto = {
      enable = true;
    };
  };
}