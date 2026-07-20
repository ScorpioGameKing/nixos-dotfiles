{ pkgs, lib, config, ... }: {
  config = lib.mkIf config.hm-modules.shells.bash.enable {
    home.packages = with pkgs; [
      bash
    ];
    programs.bash = {
      enable = true;
      shellAliases = {
        
        # General Shorthands
        btw = "echo I use NixOS, btw";
        ff = "clear && fastfetch";
        ls = "eza -TF -L 1 -a -s type --icons=auto -lUmh --git-repos --no-permissions";
        vi = "nvim";

        # General NixOS Commands
        qnc = "nix-collect-garbage -d";
        qnud = "nix flake update nixos-dotfiles-repo --flake ~/nixos-dotfiles";
        
        # Nix-Box Build Commands
        qnrb = "lg -p ~/nixos-dotfiles && sudo nixos-rebuild switch --flake ~/nixos-dotfiles#nix-box-lap-li-1";
        qnrbd = "qnud && lg -p ~/nixos-dotfiles && sudo nixos-rebuild switch --flake ~/nixos-dotfiles#nix-box-lap-li-1";
        qnrbf = "qnc && qnud && lg -p ~/nixos-dotfiles && sudo nixos-rebuild switch --flake ~/nixos-dotfiles#nix-box-lap-li-1";

      };
      
      initExtra = ''
        ff
      '';
    };
  };
}
