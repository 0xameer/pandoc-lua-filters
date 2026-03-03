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
          pgf
          environ
          trimspaces
          booktabs
          unicode-math
          lm-math
          listings
          fancyvrb
          ;
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
          export FONTCONFIG_FILE=${pkgs.makeFontsConf {
            fontDirectories = [ pkgs.noto-fonts ];
          }}
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
          export OSFONTDIR=${pkgs.noto-fonts}/share/fonts
          export FONTCONFIG_FILE=${pkgs.makeFontsConf {
            fontDirectories = [ pkgs.noto-fonts pkgs.noto-fonts-cjk-sans pkgs.noto-fonts-emoji ];
          }}
          pandoc example.md \
            --lua-filter=filters/main.lua \
            --pdf-engine=lualatex \
            --standalone \
            -V documentclass=article \
            -V mainfont="DejaVu Serif" \
            -V monofont="DejaVu Sans Mono" \
            --highlight-style=zenburn \
            -o example.pdf
          echo "Built example.pdf"
        '');
      };
    };
}
