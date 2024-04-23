{ pkgs, ... }:
{
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    globals.mapleader = " ";
    colorschemes.onedark.enable = true;
    opts = {
      number = true;
      relativenumber = true;
      shiftwidth = 2;
    };
    keymaps = [
      {
        key = "<C-h>";
        action = "<C-w>h";
      }
      {
        key = "<C-j>";
        action = "<C-w>j";
      }
      {
        key = "<C-k>";
        action = "<C-w>k";
      }
      {
        key = "<C-l>";
        action = "<C-w>l";
      }
      {
        mode = "n";
        key = "<leader>e";
        action = "<cmd>Neotree toggle<CR>";
      }
      {
        mode = "n";
        key = "<S-h>";
        action = "<cmd>bprevious<CR>";
      }
      {
        mode = "n";
        key = "<S-l>";
        action = "<cmd>bnext<CR>";
      }
      {
        mode = "n";
        key = "<leader>bb";
        action = "<cmd>e #<CR>";
      }
      {
        mode = "t";
        key = "<Esc><Esc>";
        action = "<C-\\><C-n>";
      }
      {
        mode = "n";
        key = "<leader>bd";
        action = ''
          function()
                  local bd = require("mini.bufremove").delete
                  if vim.bo.modified then
                    local choice = vim.fn.confirm(("Save changes to %q?"):format(vim.fn.bufname()), "&Yes\n&No\n&Cancel")
                    if choice == 1 then -- Yes
                      vim.cmd.write()
                      bd(0)
                    elseif choice == 2 then -- No
                      bd(0, true)
                    end
                  else
                    bd(0)
                  end
                end
          	'';
        lua = true;
      }
      {
        mode = "n";
        key = "<leader>bD";
        action = ''
          function() require("mini.bufremove").delete(0, true) end
          	'';
        lua = true;
      }
      {
        mode = "n";
        key = "<leader>wd";
        action = "<C-W>c";
      }
      {
        mode = "n";
        key = "K";
        action = "<cmd>lua vim.lsp.buf.hover()<CR>";
      }
    ];
    plugins = {
      lualine.enable = true;
      treesitter.enable = true;
      treesitter-context.enable = true;
      treesitter-textobjects.enable = true;
      ts-autotag.enable = true;
      ts-context-commentstring.enable = true;
      which-key.enable = true;
      luasnip.enable = true;
      notify.enable = true;
      noice.enable = true;
      persistence.enable = true;
      neo-tree = {
        enable = true;
        extraOptions = {
          open_files_do_not_replace_types = {
            __raw = ''
              { "trouble", "qf" }
              	'';
          };
        };
      };
      lsp = {
        enable = true;
        servers = {
          nixd.enable = true;
          bashls.enable = true;
          elixirls.enable = true;
          gopls.enable = true;
          pyright.enable = true;
          rust-analyzer = {
            enable = true;
            installCargo = false;
            installRustc = false;
          };
          svelte.enable = true;
          tailwindcss.enable = true;
          tsserver.enable = true;
        };
      };
      illuminate = {
        enable = true;
        largeFileCutoff = 2000;
      };
      conform-nvim = {
        enable = true;
        formatOnSave = {
          lspFallback = true;
          timeoutMs = 500;
        };
        formattersByFt = {
          nix = [ "nixfmt" ];
          json = [ "prettierd" ];
          markdown = [ "prettierd" ];
          html = [ "prettierd" ];
          css = [ "prettierd" ];
          javascript = [ "prettierd" ];
          svelte = [ "prettierd" ];
          yaml = [ "prettierd" ];
          sh = [ "shfmt" ];
          go = [ "gofmt" ];
          python = [ "autopep8" ];
          elixir = [ "mix" ];
          lua = [ "stylua" ];
          rust = [ "rustfmt" ];
        };
      };
      bufferline = {
        enable = true;
        closeCommand = ''function(n) require(" mini.bufremove ").delete(n, false) end'';
        rightMouseCommand = ''function(n) require(" mini.bufremove ").delete(n, false) end'';
        diagnostics = "nvim_lsp";
        diagnosticsIndicator = ''
          function(_, _, diag)
                local ret = (diag.error or "")
                  .. (diag.warning or "")
                return vim.trim(ret)
              end
        '';
        offsets = [
          {
            filetype = "neo-tree";
            text = "Neo-tree";
            highlight = "Directory";
            text_align = "left";
          }
        ];
      };
      indent-blankline = {
        enable = true;
        settings = {
          indent = {
            char = "│";
            tab_char = "│";
          };
          scope.enabled = false;
          exclude.filetypes = [
            "help"
            "alpha"
            "dashboard"
            "neo-tree"
            "Trouble"
            "trouble"
            "lazy"
            "mason"
            "notify"
            "toggleterm"
            "lazyterm"
          ];
        };
      };
      cmp = {
        enable = true;
        autoEnableSources = true;
        settings = {
          completion.completeopt = "menu,menuone,oninsert";
          sources = [
            { name = "path"; }
            { name = "nvim_lsp"; }
            { name = "buffer"; }
            { name = "luasnip"; }
          ];
          snippet.expand = ''
            function(args)
                require('luasnip').lsp_expand(args.body)
              end
            	  '';
          mapping = {
            "<C-n>" = "cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert })";
            "<C-p>" = "cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert })";
            "<C-b>" = "cmp.mapping.scroll_docs(-4)";
            "<C-f>" = "cmp.mapping.scroll_docs(4)";
            "<C-Space>" = "cmp.mapping.complete()";
            "<C-e>" = "cmp.mapping.abort()";
            "<Tab>" = "cmp.mapping.confirm({ select = true })";
            "<S-Tab>" = ''
                    cmp.mapping.confirm({
              	  behavior = cmp.ConfirmBehavior.Replace,
              	  select = true,
              	  })'';
            "<C-CR>" = ''
              function(fallback)
              cmp.abort()
              fallback()
              end'';
          };
        };
      };
      mini = {
        enable = true;
        modules = {
          surround = { };
          comment = {
            options = {
              custom_commentstring = {
                __raw = ''
                  function()
                  return require("ts_context_commentstring.internal").calculate_commentstring() or vim.bo.commentstring
                  end
                '';
              };
            };
          };
          pairs = { };
          bufremove = { };
          indentscope = {
            symbol = "│";
            options.try_as_border = true;
          };
        };
      };
    };
  };
}
