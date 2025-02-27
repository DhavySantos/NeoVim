{
  description = "A simple flake using flake-parts";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = inputs@ { self, nixpkgs, flake-parts, ... } :
  flake-parts.lib.mkFlake { inherit inputs; } {
    systems = [ "x86_64-linux" "aarch64-linux" ];
    perSystem = { pkgs, system, ... } : {
      devShells.default = pkgs.mkShell {
        packages = (with pkgs; [
          nil lua-language-server
        ]);
      };

      packages.default = pkgs.stdenv.mkDerivation {
        src = self;
        name = "nvim";
        version = "0.0.1";
        phases = [ "installPhase" ];
        installPhase = ''
          mkdir -p $out/bin

          cp -r $src/{lua,lazy-lock.json} $out

          cat > $out/config.lua <<EOF
          vim.opt.rtp:remove(vim.fn.stdpath("config") .. "/after")
          vim.opt.rtp:remove(vim.fn.stdpath("config"))
          vim.opt.rtp:prepend("$out")
          require("core")
          EOF

          cat > $out/bin/nvim <<EOF
          #!${pkgs.bash}/bin/bash
          export LAZY_LOCKFILE=$out/lazy-lock.json
          ${pkgs.neovim}/bin/nvim -u $out/config.lua "\$@"
          EOF

          chmod +x $out/bin/nvim
        '';

        meta = with pkgs.lib; {
          description = "NeoVim Configuration";
          homepage = "https://github.com/dhavysantos/neovim";
          maintainers = with maintainers; [ ryanccn ];
          platforms = platforms.linux;
          license = licenses.mit;
        };
      };
    };
  };
}
