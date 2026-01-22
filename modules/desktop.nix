# /etc/nixos/modules/desktop.nix
{ config, pkgs, ... }:

{
  # Niri compositor
#   programs.niri.enable = true;
  #programs.waybar.enable = true;

  # Enable Plasma 6 (current default)
  services.desktopManager.plasma6.enable = true;

  # Display manager (recommended for KDE)
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true; # KDE Wayland session
  };

  # Display manager
#   services.displayManager.ly.enable = true;

  # Touchpad support
  services.libinput.enable = true;

  # XDG portals for Wayland
#   xdg.portal = {
#     enable = true;
#     extraPortals = with pkgs; [
# #       xdg-desktop-portal-gtk
# #       xdg-desktop-portal-gnome
#        xdg-desktop-portal-kde
#     ];
#   };

  # Graphics
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # DBus (required for desktop environments)
  services.dbus.enable = true;

  # # Fonts
  # fonts.packages = with pkgs; [
  #   noto-fonts
  #   noto-fonts-color-emoji
  #   liberation_ttf
  #   fira-code
  # ];
}
