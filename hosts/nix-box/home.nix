# ---------------------------
# Scorpio's Nix-Box HM Config
# ---------------------------

{ config, pkgs, niri-dotfiles-repo, ... }:

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