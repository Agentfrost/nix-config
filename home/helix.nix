{ ... }:
{
  programs.helix = {
    enable = true;
    defaultEditor = true;
    settings = {
      theme = "gruvbox_dark_hard";
      keys.normal = {
        "0" = "goto_line_start";
        "$" = "goto_line_end";
        "S-h" = "goto_previous_buffer";
        "S-l" = "goto_next_buffer";
      };
      editor = {
        line-number = "relative";
        completion-timeout = 5;
        completion-trigger-len = 1;
        bufferline = "multiple";
        lsp.display-messages = true;
        statusline = {
          left = [
            "mode"
            "spinner"
            "version-control"
          ];
          center = [
            "file-name"
            "read-only-indicator"
            "total-line-numbers"
          ];
          right = [
            "diagnostics"
            "selections"
            "position"
            "file-encoding"
            "file-line-ending"
            "file-type"
          ];
          separator = "|";
          mode.normal = "NORMAL";
          mode.insert = "INSERT";
          mode.select = "SELECT";
        };
        cursor-shape = {
          normal = "block";
          insert = "bar";
          select = "underline";
        };
      };
    };
    languages = {
      language = [
        {
          name = "nix";
          scope = "source.nix";
          file-types = [ "nix" ];
          indent = {
            tab-width = 2;
            unit = "  ";
          };
          formatter = {
            command = "nixfmt";
          };
          language-servers = [ "nil" ];
          auto-format = true;
        }
        {
          name = "elixir";
          scope = "source.elixir";
          injection-regex = "(elixir|ex)";
          file-types = [
            "ex"
            "exs"
            "heex"
          ];
          shebangs = [ "elixir" ];
          roots = [ "mix.exs" ];
          auto-format = true;
          diagnostic-severity = "Hint";
          comment-token = "#";
          indent = {
            tab-width = 2;
            unit = " ";
          };
          language-servers = [ "elixir-ls" ];
        }
      ];

      language-server.elixir-ls = {
        config = {
          elixirLS.dialyzerEnabled = true;
          elixirLS.incrementalDialyzer = true;
          elixirLS.suggestSpecs = true;
        };
      };
    };
  };
}
