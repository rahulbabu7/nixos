{ config, pkgs, lib, ... }:
{
  # Enable BOTH AMD and NVIDIA drivers
  services.xserver.videoDrivers = [ "amdgpu" "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;
    open = true;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;

    prime = {
      # PRIME Sync mode - better performance for docked/clamshell use
      sync.enable = true;

      amdgpuBusId = "PCI:7:0:0";   # AMD iGPU
      nvidiaBusId = "PCI:1:0:0";   # NVIDIA dGPU
    };
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

#   # Specialization for on-the-go use (better battery life)
#   specialisation.on-the-go.configuration = {
#     system.nixos.tags = [ "on-the-go" ];
#     hardware.nvidia.prime = {
#       offload = {
#         enable = lib.mkForce true;
#         enableOffloadCmd = lib.mkForce true;
#       };
#       sync.enable = lib.mkForce false;
#     };
#   };

}
