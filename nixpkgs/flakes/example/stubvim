{
  description = "Neovim configuration with Home Manager";
  inputs = {
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs.url = "github:nixos/nixpkgs";
  };
  outputs = { self, home-manager, nixpkgs }:
    let
      configDir = "${home-manager.home.homeDirectory}/.config/nvim";
      scriptsDir = "${configDir}/lua/config";
    in {
      home-manager.users."your-user-name".programs.neovim = {
        enable = true;
        extraConfig = ''
          let options = {
            number = true;
            relativenumber = true;
            autoindent = true;
            tabstop = 4;
            shiftwidth = 4;
            smarttab = true;
            softtabstop = 4;
            mouse = "a";
            langmenu = 'en_US';
          };

          -- Set the Vim options
          for k, v in pairs(options) do
            vim.opt[k] = v
          end

          vim.o.shell = "pwsh"

          -- load packer
          require('packer').init()

          -- source packer configuration
          require('packer')

          -- source plugin definitions
          require('config.plugins')

          require('config.keymaps')

          -- Enable syntax highlighting
          vim.cmd("syntax on")
        '';
        packages = with home-manager.pkgs; [
          neovim
          ripgrep
          fd
          bat
          fzf
          entr
        ];
        config = {
          plugins = {
            enable = true;
            package = home-manager.pkgs.neovimPlugins;
            config = ''
              -- Map Ctrl-v to paste from system clipboard in normal and insert mode
              vim.api.nvim_set_keymap('n', '<C-v>', '"+p', { noremap = true })
              vim.api.nvim_set_keymap('i', '<C-v>', '<Esc>"+pa', { noremap = true })

              vim.api.nvim_set_keymap('n', '<M-v>', '<C-v>', { noremap = true })

              vim.api.nvim_set_keymap('v', 'Y', '"+y', { noremap = true })
            '';
          };
          homeDirectory = "/home/your-user-name";
          programs = {
            ripgrep = {
              enable = true;
            };
            fd = {
              enable = true;
            };
            bat = {
              enable = true;
            };
            fzf = {
              enable = true;
            };
            entr = {
              enable = true;
            };
          };
          files = [
            {
              # init.lua file
              path = "${configDir}/init.lua";
              contents = ''
                -- contents of init.lua script
              '';
            }
            {
              # keymaps.lua file
              path = "${scriptsDir}/keymaps.lua";
              contents = ''
                -- contents of keymaps.lua script
              '';
            }
            {
              # packer.lua file
              path = "${scriptsDir}/packer.lua";
              contents = ''
                -- contents of packer.lua script
              '';
            }
            {
              # plugins.lua file
              path = "${scriptsDir}/plugins.lua";
              contents = ''
                -- contents of plugins.lua script
              '';
            }
          ];
        };
      };
    };
}
