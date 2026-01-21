
# /etc/nixos/modules/audio.nix
{ config, pkgs, ... }:

{
  services.pipewire = {
    enable = true;

    # Replace PulseAudio with PipeWire+Pulse compatibility layer
    pulse.enable = true;

    # Support for most Linux audio apps (mandatory)
    #alsa.enable = true;
    #alsa.support32Bit = true;

    # Required: Manages devices, routing, Bluetooth profiles, etc.
    wireplumber.enable = true;
  };
}

