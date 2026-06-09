{
  description = "Akeyless Terraform Cloud introductory example — demonstrates JWT-based auth from Terraform Cloud workspaces to manage Akeyless static secrets";

  inputs = {
    nixpkgs.follows = "substrate/nixpkgs";
    substrate = {
      url = "github:pleme-io/substrate";
    };
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = inputs:
    (import "${inputs.substrate}/lib/repo-flake.nix" {
      inherit (inputs) nixpkgs flake-utils;
    }) {
      self = inputs.self;
      language = "terraform";
      builder = "check";
      pname = "akeyless-tf-cloud-intro";
      description = "Akeyless Terraform Cloud introductory example — demonstrates JWT-based auth from Terraform Cloud workspaces to manage Akeyless static secrets";
    };
}
