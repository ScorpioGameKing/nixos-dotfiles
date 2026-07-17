# -------------------------
# Nix-Box Base Flake 
# -------------------------
{
  description = "Scorpio's First Nix-Box";

  # -------------------------
  # Setup our Packages, Home
  # Manager and Stylix repos
  # -------------------------
  inputs = {
    create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
    nixpkgs.url = "nixpkgs/nixos-26.05";
    stylix = {
      url = "github:nix-community/stylix/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
	    inputs.nixpkgs.follows = "nixpkgs";
    };
    niri-dotfiles-repo = {
      url = "github:ScorpioGameKing/Niri-Dotfiles";
      flake = false;
    };
  };
  # -------------------------
  
  # -------------------------
  # Pass Repositories into
  # the the configuration
  # along with a basic Home 
  # Manager setup.
  # -------------------------
  outputs = { self, nixpkgs, stylix, home-manager, niri-dotfiles-repo, create_symlink, ... }: {

    # -------------------------
    # Nix-Box Flake: Niri based
    # configs for my laptop.
    # -------------------------
	  nixosConfigurations.nix-box = nixpkgs.lib.nixosSystem {
	    system = "x86_64-linux";
	    modules = [
        stylix.nixosModules.stylix
	      ./hosts/nix-box/configuration.nix
		    home-manager.nixosModules.home-manager
		    {
		      home-manager = {
		        useGlobalPkgs = true;
			      useUserPackages = true;
			      users.scorpio = import ./hosts/nix-box/home.nix;
			      backupFileExtension = "backup";
		      };
		    }
      ];
	  };
  };
  # -------------------------
}
# -------------------------
