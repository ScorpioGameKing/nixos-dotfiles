# ---------------------------
# Scorpio's Nix-Box HM Config
# ---------------------------
{ config, pkgs, ... }:

# ---------------------------
# Define shorthand variables
# ---------------------------
let
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  gruvbox-wallpapers = pkgs.fetchFromGitHub {
    owner = "AngelJumbo";
    repo = "gruvbox-wallpapers";
    rev = "main";
    sha256 = "sha256-dO/2+jTwo3s1LCLHg8f5xYI4MIJ44mSH1f+FQjDT508=";
  };
  niri-dotfiles = "${config.home.homeDirectory}/nixos-dotfiles/nix-box/configs/Niri-Dotfiles/.config";
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
# ---------------------------

{
  # ---------------------------
  # Home Manager Options
  # ---------------------------
  home.username = "scorpio";
  home.homeDirectory = "/home/scorpio";
  home.stateVersion = "26.05";
  # ---------------------------

  # ---------------------------
  # User Packages
  # ---------------------------
  home.packages = with pkgs; [
    fastfetch
    waybar
    waypaper
    quickshell
    swaylock
    swaybg
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
  # ---------------------------

  # ---------------------------
  # Enable gpg and configure gpg
  # for github, lazygit, jujutsu
  # and lazyjj
  # ---------------------------
  programs.gpg.enable = true;
  services.gpg-agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-all;
  };
  # ---------------------------

  # ---------------------------
  # Source Enabled Configs
  # ---------------------------
  xdg.configFile = builtins.mapAttrs 
    (name: subpath: {
      source = create_symlink "${niri-dotfiles}/${subpath}";
      recursive = true;
    })
    niri-dot-configs;
  # ---------------------------

  # ---------------------------
  # Source User Files
  # ---------------------------
  home.file = {
    "Pictures/wallpapers" = {
      source = create_symlink "${gruvbox-wallpapers}/wallpapers";
      recursive = true;
    };
  };
  # ---------------------------

  # ---------------------------
  # Configure User Programs
  # ---------------------------
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
  programs.oh-my-posh.enable = true;
  programs.lazygit.enable = true;

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

  programs.git = {
    enable = true;
    userName = "ScorpioGameKing";
    userEmail = "scorpiogameking@gmail.com";
    signing = {
      key = "8BD9 FC5F 99F9 F198 660A  C5D7 A716 7E06 4502 614C";
      signByDefault = true;
    };
  };
  
  programs.jujutsu = {
    enable = true;
    settings = {
      user = {
        name = "ScorpioGameKing";
        email = "scorpiogameking@gmail.com";
      };
    };
  };

  programs.gh = {
    enable = true;
    gitCredentialHelper.enable = true;
  };

  programs.yazi = {
    enable = true;
    enableBashIntegration = true;
  };
  # ---------------------------

}
# ---------------------------
