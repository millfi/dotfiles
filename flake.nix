{
  description = "Home Manager configuration of millfi";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    comfyui-src = {
      url = "github:Comfy-Org/ComfyUI/v0.12.3";
      flake = false;
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { nixpkgs, home-manager, comfyui-src, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
          rocmSupport = true;
        };
      };
    in
    {
      homeConfigurations."millfi" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [ ./home.nix ];
        extraSpecialArgs = {
          inherit comfyui-src;
        };
      };
    };
}
