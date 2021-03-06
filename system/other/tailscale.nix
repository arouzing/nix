{ config, pkgs, ... }:

{
    environment.systemPackages = [ pkgs.tailscale ];
    
    services.tailscale.enable = true;
    
    networking.firewall.allowedUDPPorts = [ config.services.tailscale.port ];

}