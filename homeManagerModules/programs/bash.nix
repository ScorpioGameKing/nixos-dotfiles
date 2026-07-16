{ ... }: {
  programs.bash = {
    enable = true;
    shellAliases = {
      
      # General Shorthands
	    btw = "echo I use NixOS, btw";
      ff = "clear && fastfetch";
      ls = "eza -TF -L 1 -a -s type --icons=auto -lUmh --git-repos --no-permissions";
      vi = "nvim";

      # General NixOS Commands
      quick-clean = "nix-collect-garbage -d";
      quick-fetchgit-update = "update-nix-fetchgit --verbose --only-commented";
      
      # Nix-Box Build Commands
      quick-rebuild-nixbox = "quick-fetchgit-update ~/nixos-dotfiles/nix-box/home.nix && sudo nixos-rebuild switch --flake ~/nixos-dotfiles/nix-box#nix-box";
      full-rebuild-nixbox = "quick-clean && quick-fetchgit-update ~/nixos-dotfiles/nix-box/home.nix && sudo nixos-rebuild switch --flake ~/nixos-dotfiles/nix-box#nix-box";
    };
    initExtra = ''
      ff
    '';
  };
}
