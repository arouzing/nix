{ self, system, home-manager, nixpkgs, ... }:

let
pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;
};
lib = nixpkgs.lib;
in 
lib.nixosSystem {
  inherit system;
  modules = [
    ./configuration.nix
    home-manager.nixosModules.home-manager
    {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.users.sky = {
        imports = [ ../../hm/sky/home.nix ];
      };
    }
  ] ++ (with self.nixosModules; [
    common
    sound
    yubikey
    u2fLogin
    gnomeDesktop
    encryptedBoot
    docker
    # harden
  ]);
}
