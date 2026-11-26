{
  description = "Typst CV template";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs =
    { self, nixpkgs, ... }:
    let
      forAllSystems = nixpkgs.lib.genAttrs [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];
      manifest = (builtins.fromTOML (builtins.readFile ./typst.toml)).package;
    in
    {
      # Typst package directory, usable as TYPST_PACKAGE_PATH:
      # $out/local/<name>/<version>/{typst.toml,template.typ,icons/}
      packages = forAllSystems (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        {
          default = pkgs.runCommandLocal "typst-package-${manifest.name}-${manifest.version}" { } ''
            dest=$out/local/${manifest.name}/${manifest.version}
            mkdir -p $dest
            cp ${./typst.toml} $dest/typst.toml
            cp ${./template.typ} $dest/template.typ
            cp -r ${./icons} $dest/icons
          '';
        }
      );

      # Also reused by private CV repos: `devShells = cv-template.devShells;`
      devShells = forAllSystems (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        {
          default = pkgs.mkShellNoCC {
            packages = [
              pkgs.typst
              pkgs.just
            ];

            # Pin fonts to nixpkgs so the PDF renders identically on any machine.
            TYPST_FONT_PATHS = "${pkgs.gyre-fonts}/share/fonts";
            TYPST_IGNORE_SYSTEM_FONTS = "true";
            # Makes `#import "@local/cv-template:<version>"` resolve to this flake.
            TYPST_PACKAGE_PATH = "${self.packages.${system}.default}";
          };
        }
      );
    };
}
