{ config, pkgs, specialArgs ? {}, ... }: {
  users.users.nixos.password = "test123";
  networking = {
    hostName = "nixos";
    wireless = {
      enable = true;
      networks."4seasNimman".psk = "sabai4seas";
      interfaces = [ "wlan0" ];
    };
  };

  networking.interfaces.end0.useDHCP = true;
  networking.interfaces.end1.useDHCP = true;

  sdImage.compressImage = false;

  system.stateVersion = "24.11";
}
