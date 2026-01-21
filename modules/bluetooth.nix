{ config, pkgs, ... }:

{
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  #services.blueman.enable = true; # Bluetooth tray UI

  # Fix for Bluetooth audio (A2DP + mic)
  hardware.bluetooth.settings = {
    General = {
      Enable = "Source,Sink,Media,Socket";
    };
  };
}

