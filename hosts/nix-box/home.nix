# ---------------------------
# Scorpio's Nix-Box HM Config
# ---------------------------

{ config, pkgs, inputs, ... }:

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
  inherit (inputs) niri-dotfiles-repo;
  niri-dot-configs = {
    niri = "niri";
    nvim = "nvim";
    waybar = "waybar";
    wezterm = "wezterm";
    fastfetch = "fastfetch";
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
  # Import Modules
  # ---------------------------

  imports = [
    ./../../homeManagerModules/groups/cli-apps.nix
    ./../../homeManagerModules/groups/desktop.nix
    ./../../homeManagerModules/groups/gui-apps.nix
    ./../../homeManagerModules/groups/shells.nix
    ./../../homeManagerModules/groups/terminals.nix
    ./../../homeManagerModules/groups/tools.nix
  ];

  # ---------------------------
  # Flake Configuration
  # ---------------------------

  # Shells
  bash.enable = true;
  
  # Terminals
  alacritty.enable = false;
  wezterm.enable = true;
  
  # Tools
  eza.enable = true;
  fastfetch.enable = true;
  fuzzel.enable = true;
  fzf.enable = true;
  gpg.enable = true;
  git.enable = true;
  gh.enable = true;
  nix-search-tv.enable = true;
  update-nix-fetchgit.enable = true;
  zoxide.enable = true;
  
  # CLI Apps
  lazygit.enable = true;
  neovim.enable = true;
  oh-my-posh.enable = true;
  television.enable = true;
  yazi.enable = false;
  
  # Desktop Enviroment
  swaybg.enable = true;
  waypaper.enable = true;
  swaylock.enable = true;
  waybar.enable = true;
  quickshell.enable = true;
  
  # GUI Apps
  brave.enable = true;
  equibop.enable = true;
  vscodium.enable = true;

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