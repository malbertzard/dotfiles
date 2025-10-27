{ config, pkgs, ... }:
{
  # Bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  hardware.bluetooth.settings = {
	  General = {
		  Experimental = true;
	  };
  };
}
