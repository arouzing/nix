{ config, pkgs, lib, ... }:

{
    networking.firewall.allowedTCPPorts = [ 53 80 443 9443  ];

    system.activationScripts.mkVPN = let
        docker = config.virtualisation.oci-containers.backend;
        dockerBin = "${pkgs.${docker}}/bin/${docker}";
        networkName = "backend";

      in ''
        ${dockerBin} network inspect ${networkName} >/dev/null 2>&1 || ${dockerBin} network create ${networkName} --subnet 172.20.0.0/16
      '';

    virtualisation.oci-containers = {
        backend = "docker";
        containers = {
            portainer = {
                image = "portainer/portainer-ce:2.11.0";
                ports = ["0.0.0.0:9443:9443"];
                volumes = [ "portainer_data:/data" "/var/run/docker.sock:/var/run/docker.sock" ];
            };
            lancache_monolith = {
                image = "lancachenet/monolithic:latest";
                ports = ["0.0.0.0:80:80" "0.0.0.0:443:443"];
                volumes = [ "lancache_data:/data" ];
                environment = {
                    USE_GENERIC_CACHE   =   "true";
                    LANCACHE_IP         =   "10.0.1.92";
                    DNS_BIND_IP         =   "10.0.1.92";
                    UPSTREAM_DNS        =   "8.8.8.8";
                    CACHE_DISK_SIZE     =   "100000m";
                    CACHE_MAX_AGE       =   "3650d";
                    TZ                  =   "America/New_York";
                };
            };
            lancache_dns = {
                image = "lancachenet/lancache-dns:latest";
                ports = ["0.0.0.0:53:53"];
                environment = {
                    USE_GENERIC_CACHE   =   "true";
                    LANCACHE_IP         =   "10.0.1.92";
                    DNS_BIND_IP         =   "10.0.1.92";
                    UPSTREAM_DNS        =   "8.8.8.8";
                    CACHE_DISK_SIZE     =   "100000m";
                    CACHE_MAX_AGE       =   "3650d";
                    TZ                  =   "America/New_York";
                };
            };
            pihole = {
                image = "pihole/pihole:latest";
                volumes = [ 
                    "pihole_data/etc-pihole:/etc/pihole"
                    "pihole_data/etc-dnsmasq.d:/etc/dnsmasq.d"
                    ];
                ports = ["0.0.0.0:8080:80"];
                environment = {
                    TZ                  =   "America/New_York";
                };
            };
        };
    };
}