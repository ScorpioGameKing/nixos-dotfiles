# ---------------------------
# Scorpio's Nix-Box HM Config
# ---------------------------

{ config, pkgs, niri-dot-configs, ... }:

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
  # Rev comment for targeted updates. ^^^ is huge and takes forever
  #niri-dotfiles-repo = pkgs.fetchFromGitHub {
  #  owner = "ScorpioGameKing";
  #  repo = "Niri-Dotfiles";
  #  rev = "313a30c8cebacce8b5c3913ef8abed897eeb7ecf"; #master
  #  sha256 = "0sp1iivyia1k6i87gdyxqs70p43m12wjdhaz6bf1ls2c8c4bmv3a";
  #};
  niri-dot-configs = {
    niri = "niri";
    nvim = "nvim";
    waybar = "waybar";
    wezterm = "wezterm";
    fastfetch = "fastfetch";
    #yazi = "yazi";
    quickshell = "quickshell";
    swaylock = "swaylock";
    fuzzel = "fuzzel";
    yeet = "yeet";
  };
in

{
  # ---------------------------
  # Home Manager Options
  # ---------------------------

  home.username = "scorpio";
  home.homeDirectory = "/home/scorpio";
  home.stateVersion = "26.05";

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
    neovim
    brave
    fuzzel
    update-nix-fetchgit
    vscodium
  ];

  # ---------------------------
  # Import Modules
  # ---------------------------

  imports = [
    ./../../homeManagerModules/groups/cli-apps.nix
    ./../../homeManagerModules/groups/shells.nix
    ./../../homeManagerModules/groups/terminals.nix
    ./../../homeManagerModules/groups/tools.nix
  ];

  # ---------------------------
  # Flake Configuration
  # ---------------------------

  bash.enable = true;
  
  eza.enable = true;
  fzf.enable = true;
  gpg.enable = true;
  git.enable = true;
  gh.enable = true;
  nix-search-tv.enable = true;
  zoxide.enable = true;
  
  lazygit.enable = true;
  oh-my-posh.enable = true;
  television.enable = true;
  yazi.enable = true;
  
  alacritty.enable = false;
  wezterm.enable = true;
  
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
  # Source User Files
  # ---------------------------

  home.file = {
    "Pictures/wallpapers" = {
      source = create_symlink "${gruvbox-wallpapers}/wallpapers";
      recursive = true;
    };
  };
}