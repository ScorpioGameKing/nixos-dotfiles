{ config, pkgs, ... }:

let
  niri-dotfiles = "${config.home.homeDirectory}/nixos-dotfiles/nix-box/configs/Niri-Dotfiles/.config";
  gruvbox-wallpapers = pkgs.fetchFromGitHub {
    owner = "AngelJumbo";
    repo = "gruvbox-wallpapers";
    rev = "main";
    sha256 = "0y10yd8lr4aj820cz7d2a3scy1ml8qrf9dg70vss7apglz8sgr1k";
  };
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  niri-dot-configs = {
    niri = "niri";
    nvim = "nvim";
    waybar = "waybar";
    wezterm = "wezterm";
    fastfetch = "fastfetch";
    yazi = "yazi";
    quickshell = "quickshell";
    swaylock = "swaylock";
    fuzzel = "fuzzel";
  };
in

{
  home.username = "scorpio";
  home.homeDirectory = "/home/scorpio";
  home.stateVersion = "26.05";

  programs.bash = {
    enable = true;
    shellAliases = {
	    btw = "echo I use NixOS, btw";
      ff = "clear && fastfetch";
      ls = "eza -TF -L 1 -a -s type --icons=auto -lUmh --git-repos --no-permissions";
      vi = "nvim";
      lzg = "lazygit";
      lzj = "lazyjj";
      quick-rebuild-nixbox = "sudo nixos-rebuild switch --flake ~/nixos-dotfiles/nix-box#nix-box";
      quick-clean = "nix-collect-garbage -d";
    };
    initExtra = ''
      ff
    '';
  };

  programs.wezterm.enable = true;

  programs.eza = {
    enable = true;
    enableBashIntegration = true;
    icons = "auto";
  };

  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
    options = [
      "--cmd cd"
    ];
  };

  programs.fzf = {
    enable = true;
    enableBashIntegration = true;
  };

  programs.oh-my-posh.enable = true;

  programs.git = {
    enable = true;
    userName = "ScorpioGameKing";
    userEmail = "scorpiogameking@gmail.com";
    signing = {
      key = "8BD9 FC5F 99F9 F198 660A  C5D7 A716 7E06 4502 614C";
      signByDefault = true;
    };
  };
  
  programs.gpg.enable = true;
  services.gpg-agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-all;
  };
  programs.lazygit.enable = true;
  programs.jujutsu.enable = true;

  programs.gh = {
    enable = true;
    gitCredentialHelper.enable = true;
  };

  programs.yazi = {
    enable = true;
    enableBashIntegration = true;
  };

  xdg.configFile = builtins.mapAttrs 
    (name: subpath: {
      source = create_symlink "${niri-dotfiles}/${subpath}";
      recursive = true;
    })
    niri-dot-configs;

  home.packages = with pkgs; [
    fastfetch
    waybar
    waypaper
    quickshell
    swaylock
    wezterm
    oh-my-posh
    git
    lazygit
    jujutsu
    lazyjj
    gh
    neovim
    brave
    yazi
    fuzzel
  ];
}
