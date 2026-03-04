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
          fontspec
          geometry
          hyperref
          xcolor
          tcolorbox
          pgf# includes TikZ \u2014 do NOT add tikz separately
          tikz-cd# commutative diagrams for category theory
          environ
          trimspaces
          booktabs
          unicode-math
          lm-math
          listings
          fancyvrb
          mathtools# math-format.lua
          lualatex-math# math-format.lua
          framed# required by fancyvrb/pandoc highlighting
          ;
      };
      fontsConf = pkgs.makeFontsConf {
        fontDirectories = [ pkgs.noto-fonts ];
      };
    in
    {
      # nix build .#example-pdf
      packages.${system}.example-pdf = pkgs.stdenv.mkDerivation {
        name = "example-pdf";
        src = ./.;
        buildInputs = [ pkgs.pandoc tex pkgs.noto-fonts ];
        buildPhase = ''
          export HOME=$(pwd)
          export OSFONTDIR=${pkgs.noto-fonts}/share/fonts
          export FONTCONFIG_FILE=${fontsConf}
          luaotfload-tool --update
          make pdf
        '';
        installPhase = "install -D example.pdf $out/example.pdf";
      };

      # nix develop
      devShells.${system}.default = pkgs.mkShell {
        name = "pandoc-dev";
        packages = [
          pkgs.pandoc
          tex
          pkgs.noto-fonts
          pkgs.entr
          pkgs.lua5_1
          pkgs.luajit
          # removed pkgs.pandoc-lua-filters \u2014 conflicts with local filters
        ];
        shellHook = ''
          export FONTCONFIG_FILE=${fontsConf}
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
          export HOME=$(mktemp -d)
          export FONTCONFIG_FILE=${fontsConf}
          luaotfload-tool --update
          pandoc example.md \
            --lua-filter=filters/main.lua \
            --pdf-engine=lualatex \
            --standalone \
            -V documentclass=article \
            -V mainfont="Noto Serif" \
            -V sansfont="Noto Sans" \
            -V monofont="Noto Sans Mono" \
            --highlight-style=zenburn \
            -o example.pdf
          echo "Built example.pdf"
        '');
      };
    };
}
