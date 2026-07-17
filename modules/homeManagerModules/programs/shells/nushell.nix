{ pkgs, lib, config, ... }: {
  
  options = {
    nushell.enable = lib.mkEnableOption "enables nushell";
  };

  config = lib.mkIf config.nushell.enable {
    home.packages = with pkgs; [
      nushell
    ];
    home.shell.enableNushellIntegration = true;
    programs.nushell = {
      enable = true;
      shellAliases = {
        
        # General Shorthands
        btw = "echo I use NixOS, btw";
        ff = "clear ; fastfetch";
        ls = "eza -TF -L 1 -a -s type --icons=auto -lUmh --git-repos --no-permissions";
        vi = "nvim";

        # General NixOS Commands
        qnc = "nix-collect-garbage -d";
        qnud = "nix flake update niri-dotfiles-repo --flake ~/nixos-dotfiles";
        
        # Nix-Box Build Commands
        qnrb = "lg ~/nixos-dotfiles ; sudo nixos-rebuild switch --flake ~/nixos-dotfiles#nix-box";
        qnrbd = "qnud ; lg ~/nixos-dotfiles ; sudo nixos-rebuild switch --flake ~/nixos-dotfiles#nix-box";
        qnrbf = "qnc ; qnud ; lg ~/nixos-dotfiles ; sudo nixos-rebuild switch --flake ~/nixos-dotfiles#nix-box";

      };
    };
  };
}
