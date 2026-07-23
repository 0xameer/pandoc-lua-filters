{
  description = "pandoc + lua-filters -> PDF via LuaLaTeX";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};

      tex = pkgs.texlive.combine {
        inherit (pkgs.texlive)
          scheme-small# core latex/lualatex engine + base classes
          latex-bin
          luatex

          # fonts / unicode (lualatex)
          fontspec
          unicode-math
          luaotfload
          lualatex-math
          selnolig

          # math
          amsmath
          mathtools

          # color / boxes (callouts)
          xcolor
          mdframed
          framed# mdframed dependency
          needspace# mdframed dependency
          etoolbox# mdframed dependency
          zref# mdframed dependency (page split bookkeeping)

          # diagrams
          pgf# provides tikz
          tikz-cd

          # line-breaking / typography
          xurl
          microtype
          csquotes

          # pandoc default-template requirements
          hyperref
          url
          ulem
          upquote
          geometry
          booktabs

          # code listings (used by linenum.lua)
          listings

          # --- ADDED: required by resume.tex ---
          titlesec# for \titleformat and \titlespacing
          enumitem# for \setlist[itemize] and \setlist[description]
          ;
      };

      fontsConf = pkgs.makeFontsConf {
        fontDirectories = [
          pkgs.noto-fonts
          pkgs.dejavu_fonts
        ];
      };

      allPdfs = pkgs.stdenv.mkDerivation {
        name = "all-pdfs";
        src = ./.;
        buildInputs = [ pkgs.pandoc tex pkgs.noto-fonts pkgs.dejavu_fonts pkgs.gnumake ];

        buildPhase = ''
          export HOME=$(pwd)
          export OSFONTDIR="${pkgs.noto-fonts}/share/fonts//:${pkgs.dejavu_fonts}/share/fonts//"
          export FONTCONFIG_FILE=${fontsConf}
          luaotfload-tool --update
          rm -rf output/*.pdf
          make pdf
        '';

        installPhase = ''
          mkdir -p $out
          cp output/*.pdf $out/
        '';
      };
    in
    {
      # Reverted to 'all-pdfs' to match CI
      packages.${system} = {
        all-pdfs = allPdfs;
      };

      devShells.${system}.default = pkgs.mkShell {
        name = "pandoc-dev";
        packages = [
          pkgs.pandoc
          tex
          pkgs.noto-fonts
          pkgs.dejavu_fonts
          pkgs.entr
          pkgs.lua5_1
          pkgs.luajit
          pkgs.gnumake
        ];
        shellHook = ''
          export FONTCONFIG_FILE=${fontsConf}
          echo "pandoc $(pandoc --version | head -1)"
          echo "make       -> output/*.pdf + output/*.html"
          echo "make watch -> rebuild on change"
        '';
      };

      apps.${system}.build = {
        type = "app";
        program = toString (pkgs.writeShellScript "build" ''
          set -e
          export HOME=$(mktemp -d)
          export FONTCONFIG_FILE=${fontsConf}
          luaotfload-tool --update
          make all
          echo "Built all PDFs and HTMLs in output/"
        '');
      };
    };
}
