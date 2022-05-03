{ config, pkgs, ... }:

{
  nixpkgs.overlays = [
    (self: super: {
     st = super.st.overrideAttrs (oldAttrs: rec {
         patches = [

         ];
         });
     })
  ];
}
