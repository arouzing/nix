{ config, pkgs, ... }:

{
# enable gnome and wayland
programs.xwayland.enable = true;
hardware.opengl.enable = true ;
services.xserver = {
    enable = true;
    desktopManager.gnome.enable = true;
    displayManager.gdm = {
        wayland = true;
        enable = true;
    };
};

# pipewire support
security.rtkit.enable = true;
services.pipewire = {
  enable = true;
  alsa.enable = true;
  alsa.support32Bit = true;
  pulse.enable = true;
  # If you want to use JACK applications, uncomment this
  #jack.enable = true;

  # use the example session manager (no others are packaged yet so this is enabled by default,
  # no need to redefine it in your config for now)
  #media-session.enable = true;
};
}