{ config, pkgs, specialArgs ? { }, ... }: {
  users.users.nixos = {
    password = "test123";
    isNormalUser = true;
  };

  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    substituters = [
      "https://cache.nichi.co"
      "https://cache.ztier.in"
    ];
    trusted-public-keys = [
      "hydra.nichi.co-0:P3nkYHhmcLR3eNJgOAnHDjmQLkfqheGyhZ6GLrUVHwk="
      "cache.ztier.link-1:3P5j2ZB9dNgFFFVkCQWT3mh0E+S3rIWtZvoql64UaXM="
    ];
  };

  networking = {
    hostName = "vision";
    wireless = {
      enable = true;
      networks."GL-AR300M-949-NOR".psk = "goodlife";
      interfaces = [ "wlan0" ];
    };
  };

  networking.interfaces.end0.useDHCP = true;
  networking.interfaces.end1.useDHCP = true;

  sdImage.compressImage = false;

  system.stateVersion = "24.11";
}
