{ ... }:
{
  programs.helix = {
    enable = true;
    defaultEditor = true;
    settings = {
      theme = "ayu_evolve";
      editor = {
        line-number = "relative";
        lsp.display-messages = true;
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
          language-servers = [
            "elixir-ls"
          ];
        }
      ];
    };
  };
}
