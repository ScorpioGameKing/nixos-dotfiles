# ---------------------------
# Scorpio's Nix-Box HM Config
# ---------------------------

{ self, config, pkgs, ... }:

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
  niri-dotfiles-repo = pkgs.fetchFromGitHub {
    owner = "ScorpioGameKing";
    repo = "Niri-Dotfiles";
    rev = "09068d3025650693fc0f5ff552a8d53049764669"; #master
    sha256 = "0g4xs0dpqb7mn6wljh6wpbpa1r0pq1d4i4rm4zz9h9hqi4wb255b";
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
  yazi.enable = true;
  
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

  dots = "${inputs.niri-dots}";

  xdg.configFile = builtins.mapAttrs 
    (name: subpath: {
      source = create_symlink "${dots}/.config/${subpath}";
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