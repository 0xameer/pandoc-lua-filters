{

  description = "pandoc + lua-filters -> PDF via LuaLaTeX";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      tex = pkgs.texlive.combine {
        inherit (pkgs.texlive)
          scheme-full# everything \u2014 no more missing .sty ever
          luaotfload
          lualatex-math
          selnolig
          ;
      };
      fontsConf = pkgs.makeFontsConf {
        fontDirectories = [ pkgs.noto-fonts ];
      };
    in
    {
      # nix build .#system-design-pdf
      packages.${system}.system-design-pdf = pkgs.stdenv.mkDerivation {
        name = "system-design-pdf";
        src = ./.;
        buildInputs = [ pkgs.pandoc tex pkgs.noto-fonts ];
        buildPhase = ''
          export HOME=$(pwd)
          export OSFONTDIR="${pkgs.noto-fonts}/share/fonts//"
          export FONTCONFIG_FILE=${fontsConf}
          luaotfload-tool --update
          make system-design.pdf
        '';
        installPhase = "install -D system-design.pdf $out/system-design.pdf";
      };

      # nix build .#resume-pdf
      packages.${system}.resume-pdf = pkgs.stdenv.mkDerivation {
        name = "resume-pdf";
        src = ./.;
        buildInputs = [ pkgs.pandoc tex pkgs.noto-fonts ];
        buildPhase = ''
          export HOME=$(pwd)
          export OSFONTDIR="${pkgs.noto-fonts}/share/fonts//"
          export FONTCONFIG_FILE=${fontsConf}
          luaotfload-tool --update
          make resume.pdf
        '';
        installPhase = "install -D resume.pdf $out/resume.pdf";
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
          echo "make       -> system-design.pdf"
          echo "make watch -> rebuild on change"
          echo "make html  -> system-design.html"
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
          pandoc system-design.md \
            --lua-filter=filters/main.lua \
            --pdf-engine=lualatex \
            --standalone \
            -V documentclass=article \
            -V mainfont="Noto Serif" \
            -V sansfont="Noto Sans" \
            -V monofont="Noto Sans Mono" \
            --highlight-style=zenburn \
            -o system-design.pdf
          echo "Built system-design.pdf"
        '');
      };
    };
}
