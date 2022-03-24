{
  description = ''omni is a DSL for low-level audio programming.'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-omni-0_4_0.flake = false;
  inputs.src-omni-0_4_0.ref   = "refs/tags/0.4.0";
  inputs.src-omni-0_4_0.owner = "vitreo12";
  inputs.src-omni-0_4_0.repo  = "omni";
  inputs.src-omni-0_4_0.type  = "github";
  
  inputs."cligen".owner = "nim-nix-pkgs";
  inputs."cligen".ref   = "master";
  inputs."cligen".repo  = "cligen";
  inputs."cligen".dir   = "v1_5_23";
  inputs."cligen".type  = "github";
  inputs."cligen".inputs.nixpkgs.follows = "nixpkgs";
  inputs."cligen".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-omni-0_4_0"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-omni-0_4_0";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}