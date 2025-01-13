{ inputs, makeScript, projectPath, ... }:
makeScript {
  entrypoint = ./entrypoint.sh;
  name = "spell-checker";
  replace = { __argNPMPath__ = projectPath "/lint/spell-checker"; };
  searchPaths = {
    bin = [
      inputs.nixpkgs.nodePackages.cspell
      inputs.nixpkgs.git
      inputs.nixpkgs.nodejs_22
    ];
  };
}
