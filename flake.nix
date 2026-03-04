{
  description = "pandoc + lua-filters -> PDF via LuaLaTeX";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      tex = pkgs.texlive.combine {
        inherit (pkgs.texlive)
          scheme-full
          luaotfload
          lualatex-math
          selnolig
          ;
      };
      fontsConf = pkgs.makeFontsConf {
        fontDirectories = [ pkgs.noto-fonts ];
      };

      # build all markdown/*.md -> output/*.pdf in one derivation
      allPdfs = pkgs.stdenv.mkDerivation {
        name = "all-pdfs";
        src = ./.;
        buildInputs = [ pkgs.pandoc tex pkgs.noto-fonts pkgs.gnumake ];
        buildPhase = ''
          export HOME=$(pwd)
          export OSFONTDIR="${pkgs.noto-fonts}/share/fonts//"
          export FONTCONFIG_FILE=${fontsConf}
          luaotfload-tool --update
          make pdf
        '';
        installPhase = ''
          mkdir -p $out
          cp output/*.pdf $out/
        '';
      };

    in
    {
      packages.${system} = {
        all-pdfs = allPdfs;
        # convenience: nix build .#resume-pdf still works
        resume-pdf = pkgs.stdenv.mkDerivation {
          name = "resume-pdf";
          src = ./.;
          buildInputs = [ pkgs.pandoc tex pkgs.noto-fonts pkgs.gnumake ];
          buildPhase = ''
            export HOME=$(pwd)
            export OSFONTDIR="${pkgs.noto-fonts}/share/fonts//"
            export FONTCONFIG_FILE=${fontsConf}
            luaotfload-tool --update
            make output/resume.pdf
          '';
          installPhase = "install -D output/resume.pdf $out/resume.pdf";
        };
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
          pkgs.gnumake
        ];
        shellHook = ''
          export FONTCONFIG_FILE=${fontsConf}
          echo "pandoc $(pandoc --version | head -1)"
          echo "make       -> output/*.pdf + output/*.html"
          echo "make watch -> rebuild on change"
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
          make all
          echo "Built all PDFs and HTMLs in output/"
        '');
      };
    };
}
