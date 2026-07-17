{ pkgs, lib, config, ... }: {
  
  imports = [
    ./../programs/cli-apps/joshuto.nix
    ./../programs/cli-apps/lazygit.nix
    ./../programs/cli-apps/neovim.nix
    ./../programs/cli-apps/oh-my-posh.nix
    ./../programs/cli-apps/television.nix
    ./../programs/cli-apps/yazi.nix
  ];

  options = {
    cli-apps.enable = lib.mkEnableOption "enables cli-apps";
  };

  config = lib.mkIf config.cli-apps.enable = {
    
  };
}
