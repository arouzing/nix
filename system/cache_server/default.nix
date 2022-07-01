{ system, lib, self, ... }:

lib.nixosSystem {
  inherit system;
  modules = [
    ./configuration.nix
  ] ++ (with self.nixosModules; [
    common
    encryptedBoot
    docker
    openssh
    # harden
  ]);
}