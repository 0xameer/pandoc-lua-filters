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
        /*
        src = ./.; which includes the output/ directory. Since CI commits PDFs back into output/,
        those PDFs are part of the source. When Nix copies the source in, output/*.pdf already exists,
        and since Nix resets all timestamps to epoch, make pdf sees the PDFs as up to date and skips
        rebuilding them. force a clean rebuild
        always rebuild the PDFs regardless of what's in output/ from the previous CI commit.
        */
        buildPhase = ''
          export HOME=$(pwd)
          export OSFONTDIR="${pkgs.noto-fonts}/share/fonts//"
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
      packages.${system} = {
        all-pdfs = allPdfs;
        # convenience: nix build .#resume-pdf still works , redundant , it ll build like all others
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
