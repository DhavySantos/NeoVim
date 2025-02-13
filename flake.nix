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
      packages.default = pkgs.stdenv.mkDerivation {
				src = self;
        name = "nvim";
        version = "0.0.1";
        phases = [ "installPhase" ];
        installPhase = ''
          mkdir -p $out/{bin,lua}

          cp -r $src/lua $out

          cat > $out/config.lua <<EOF
          vim.opt.rtp:remove(vim.fn.stdpath("config") .. "/after")
          vim.opt.rtp:remove(vim.fn.stdpath("config"))
          vim.opt.rtp:append("$out")
          require("core")
          EOF

          cat > $out/bin/nvim <<EOF
          #!${pkgs.bash}/bin/bash
          ${pkgs.neovim}/bin/nvim -u $out/config.lua "\$@"
          EOF

          chmod +x $out/bin/nvim
        '';
      };
    };
  };
}

