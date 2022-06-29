inputs:
{
    lib.nixosSystem {
        inherit system;
        modules = [
            ./system/desktop/configuration.nix
            home-manager.nixosModules.home-manager {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.users.sky = {
                    imports = [ ./hm/sky/home.nix ];
                };
            }
        ]++ (with self.nixosModules; [
            common
            sound
            yubikey
            u2fLogin
            gnomeDesktop
            encryptedBoot
        ]);
    };
}