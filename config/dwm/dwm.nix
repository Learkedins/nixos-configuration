{ config, pkgs, ... }:

{
  nixpkgs.overlays = [
    (self: super: {
     dwm = super.dwm.overrideAttrs (oldAttrs: rec {
         patches = [
          ./gaps.diff          
          ./autostart.diff
         ];
         });
     })
  ];      
}
