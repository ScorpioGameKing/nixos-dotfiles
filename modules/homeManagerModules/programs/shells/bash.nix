{ pkgs, lib, config, osConfig, ... }: 
let
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  current_host_flake = "~/nixos-dotfiles#${osConfig.nixos-modules.system.networking.hostName}";
in
{
  config = lib.mkIf config.hm-modules.shells.bash.enable {
    programs.bash = {
      enable = true;
      shellAliases = {
        
        # General Shorthands
        btw = "echo I use NixOS, btw";
        ff = lib.mkIf config.hm-modules.tools.fastfetch.enable "clear && fastfetch";
        ls = lib.mkIf config.hm-modules.tools.eza.enable "eza -TF -L 1 -a -s type --icons=auto -lUmh --git-repos --no-permissions";
        vi = "nvim";

        jo = lib.mkIf config.hm-modules.cli-apps.joshuto.enable "joshuto";

        # General NixOS Commands
        qnc = "nix-collect-garbage -d";
        qnud = "nix flake update nixos-dotfiles-repo --flake ~/nixos-dotfiles";
        
        # Nix-Box Build Commands
        qnrb = "lg -p ~/nixos-dotfiles && sudo nixos-rebuild switch --flake ${current_host_flake}";
        qnrbd = "qnud && lg -p ~/nixos-dotfiles && sudo nixos-rebuild switch --flake ${current_host_flake}";
        qnrbf = "qnud && lg -p ~/nixos-dotfiles && sudo nixos-rebuild switch --flake ${current_host_flake}  && qnc";
      };
      
      initExtra = ''
        ff
      '';
    };
  };
}
