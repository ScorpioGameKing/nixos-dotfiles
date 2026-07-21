{ pkgs, lib, config, ... }: {
  config = lib.mkIf config.hm-modules.shells.nushell.enable {
    home.shell.enableNushellIntegration = true;
    programs.bash = lib.mkIf config.hm-modules.shells.bash.enable {
      enable = true;
      initExtra = ''
        nu
      '';
    };
    programs.nushell = {
      enable = true;
      shellAliases = {
        
        # General Shorthands
        btw = "echo I use NixOS, btw";
        ff = lib.mkIf config.hm-modules.tools.fastfetch.enable "clear ; fastfetch";
        ls = lib.mkIf config.hm-modules.tools.eza.enable "eza -TF -L 1 -a -s type --icons=auto -lUmh --git-repos --no-permissions";
        vi = lib.mkIf config.hm-modules.cli-apps.neovim.enable "nvim";
        jo = lib.mkIf config.hm-modules.cli-apps.joshuto.enable "joshuto";

        # General NixOS Commands
        qnc = "nix-collect-garbage -d";
        qnud = "nix flake update nixos-dotfiles-repo --flake ~/nixos-dotfiles";
        
        # Nix-Box Build Commands
        qnrb = "lg ~/nixos-dotfiles ; sudo nixos-rebuild switch --flake ~/nixos-dotfiles#nix-box-lap-li-1";
        qnrbd = "qnud ; lg ~/nixos-dotfiles ; sudo nixos-rebuild switch --flake ~/nixos-dotfiles#nix-box-lap-li-1";
        qnrbf = "qnc ; qnud ; lg ~/nixos-dotfiles ; sudo nixos-rebuild switch --flake ~/nixos-dotfiles#nix-box-lap-li-1";

      };
      extraLogin = ''
        fastfetch
      '';
    };
  };
}
