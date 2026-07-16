# ---------------------------
# Scorpio's Nix-Box HM Config
# ---------------------------
{ config, pkgs, ... }:

# ---------------------------
# Define shorthand variables
# for functions and fetched
# packages/resources.
# ---------------------------
let
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  gruvbox-wallpapers = pkgs.fetchFromGitHub {
    owner = "AngelJumbo";
    repo = "gruvbox-wallpapers";
    rev = "main";
    sha256 = "sha256-dO/2+jTwo3s1LCLHg8f5xYI4MIJ44mSH1f+FQjDT508=";
  };
  niri-dotfiles-repo = pkgs.fetchFromGitHub {
    owner = "ScorpioGameKing";
    repo = "Niri-Dotfiles";
    rev = "313a30c8cebacce8b5c3913ef8abed897eeb7ecf"; #master
    sha256 = "0sp1iivyia1k6i87gdyxqs70p43m12wjdhaz6bf1ls2c8c4bmv3a";
  };
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
    yeet = "yeet";
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
    gh
    neovim
    brave
    yazi
    fuzzel
    nix-search-tv
    television
    update-nix-fetchgit
  ];
  # ---------------------------
  
  # ---------------------------
  #
  # ---------------------------
  imports = [
    ./homeManagerModules/groups/terminal.nix
  ];

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
  # Source Niri Enabled Configs
  # ---------------------------
  xdg.configFile = builtins.mapAttrs 
    (name: subpath: {
      source = create_symlink "${niri-dotfiles-repo}/.config/${subpath}";
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

  programs.wezterm.enable = true;
  programs.oh-my-posh = {
    enable = true;
    enableBashIntegration = true;
    useTheme = "gruvbox";
  };
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
