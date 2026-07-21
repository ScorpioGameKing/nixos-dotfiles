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
    nixos-dotfiles-repo = {
      url = "github:ScorpioGameKing/nixos-dotfiles-repo/main";
      flake = false;
    };
  };
  
  # -------------------------
  # Pass Repositories into
  # the the configuration
  # along with a basic Home 
  # Manager setup.
  # -------------------------

  outputs = inputs @ { self, nixpkgs, stylix, home-manager, ... }: {

    # -------------------------
    # Nix-Box Flake: Niri based
    # configs for my laptop.
    # -------------------------

	  packages.x86_64-linux.nixosConfigurations.nix-box-lap-li-1 = nixpkgs.lib.nixosSystem {
	    system = "x86_64-linux";
	    modules = [
        stylix.nixosModules.stylix
	      ./hosts/laptops/lenovo-ideapad-1/nix-box/configuration.nix
		    home-manager.nixosModules.home-manager
		    {
		      home-manager = {
		        useGlobalPkgs = true;
			      useUserPackages = true;
            extraSpecialArgs = { inherit inputs; };
			      users.scorpio = import ./hosts/laptops/lenovo-ideapad-1/nix-box/home.nix;
			      backupFileExtension = "backup";
		      };
		    }
      ];
	  };
  };
}
