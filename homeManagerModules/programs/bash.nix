{ lib, config, ... }: {
  options = {
    bash.enable = lib.mkEnableOption "enables bash";
  };

  config = lib.mkIf config.bash.enable {
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
        qnfg = "update-nix-fetchgit --verbose --only-commented";
        qnfgh = "update-nix-fetchgit --verbose --only-commented ~/nixos-dotfiles/hosts/nix-box/home.nix";
        
        # Nix-Box Build Commands
        qnrb = "lg -p ~/nixos-dotfiles && sudo nixos-rebuild switch --flake ~/nixos-dotfiles#nix-box";
        qnrbf = "qnc && qnfgh && lg -p ~/nixos-dotfiles && sudo nixos-rebuild switch --flake ~/nixos-dotfiles#nix-box";
      };
      initExtra = ''
        ff
      '';
    };
  };
}
