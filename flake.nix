{
  description = "pandoc + lua-filters -> PDF via LuaLaTeX";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};

      tex = pkgs.texlive.combine {
        inherit (pkgs.texlive)
          scheme-small
          luatex
          luaotfload
          fontspec# font selection for LuaLaTeX
          geometry# page margins
          hyperref# colorlinks
          xcolor# colors
          tcolorbox# callout boxes
          pgf# tcolorbox dependency
          environ# tcolorbox dependency
          trimspaces# tcolorbox dependency
          booktabs# nice tables
          unicode-math# math with LuaLaTeX
          lm-math# Latin Modern math fonts
          listings# code blocks
          fancyvrb# pandoc code highlighting
          ;
      };

    in
    {
      # nix build .#example-pdf
      packages.${system}.example-pdf = pkgs.stdenv.mkDerivation {
        name = "example-pdf";
        src = ./.;
        buildInputs = [ pkgs.pandoc tex ];
        buildPhase = "make pdf";
        installPhase = "install -D example.pdf $out/example.pdf";
      };

      # nix develop
      devShells.${system}.default = pkgs.mkShell {
        name = "pandoc-dev";
        packages = [
          pkgs.pandoc
          tex
          pkgs.entr # watch mode
          pkgs.lua5_1 # run/test filters standalone
          pkgs.luajit # alternative lua runtime
        ];
        shellHook = ''
          echo "pandoc $(pandoc --version | head -1)"
          echo "make       -> example.pdf"
          echo "make watch -> rebuild on change"
          echo "make html  -> example.html"
        '';
      };

      # nix run .#build
      apps.${system}.build = {
        type = "app";
        program = toString (pkgs.writeShellScript "build" ''
          set -e
          pandoc example.md \
            --lua-filter=filters/main.lua \
            --pdf-engine=lualatex \
            --standalone \
            -V documentclass=article \
            -o example.pdf
          echo "Built example.pdf"
        '');
      };
    };
}
