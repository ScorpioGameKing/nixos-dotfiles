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
    nixpkgs.url = "nixpkgs/nixos-26.05";
    stylix = {
      url = "github:nix-community/stylix/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
	    inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  # -------------------------
  
  # -------------------------
  # Pass Repositories into
  # the the configuration
  # along with a basic Home 
  # Manager setup.
  # -------------------------
  outputs = { self, nixpkgs, stylix, home-manager, ... }: {
	  nixosConfigurations.nix-box = nixpkgs.lib.nixosSystem {
	    system = "x86_64-linux";
	    modules = [
        stylix.nixosModules.stylix
	      ./configuration.nix
		    home-manager.nixosModules.home-manager
		    {
		      home-manager = {
		        useGlobalPkgs = true;
			      useUserPackages = true;
			      users.scorpio = import ./home.nix;
			      backupFileExtension = "backup";
		      };
		    }
      ];
	  };
  };
  # -------------------------
}
# -------------------------
