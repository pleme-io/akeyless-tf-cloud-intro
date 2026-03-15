{
  description = "Akeyless Terraform Cloud introductory example — demonstrates JWT-based auth from Terraform Cloud workspaces to manage Akeyless static secrets";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    substrate = {
      url = "github:pleme-io/substrate";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, substrate, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs { inherit system; };
      mkTerraformModuleCheck = (import "${substrate}/lib/terraform-module.nix").mkTerraformModuleCheck;
    in {
      checks.default = mkTerraformModuleCheck pkgs {
        pname = "akeyless-tf-cloud-intro";
        version = "0.0.0-dev";
        src = self;
        description = "Akeyless Terraform Cloud introductory example — demonstrates JWT-based auth from Terraform Cloud workspaces to manage Akeyless static secrets";
        homepage = "https://github.com/pleme-io/akeyless-tf-cloud-intro";
      };

      devShells.default = pkgs.mkShellNoCC {
        packages = with pkgs; [
          opentofu
          tflint
          terraform-docs
        ];
      };
    });
}
