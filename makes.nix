# For more information visit:
# https://github.com/fluidattacks/makes
{ fetchNixpkgs, ... }:
let
  nixpkgs = fetchNixpkgs {
    rev = "4a92571f9207810b559c9eac203d1f4d79830073";
    sha256 = "sha256:0sp7qjbb7dvrh4zvd40i6y7jwsd1v1qj44f0c95q88g7fikda8gq";
    overlays = [
      (_: super: {
        # Nginx by default tries to use directories owned by root
        # We have to recompile it pointing to the user-space
        nginxLocal = super.nginx.overrideAttrs (attrs: {
          configureFlags = attrs.configureFlags ++ [
            "--error-log-path=/tmp/error.log"
            "--http-client-body-temp-path=/tmp/nginx_client_body"
            "--http-fastcgi-temp-path=/tmp/nginx_fastcgi"
            "--http-log-path=/tmp/access.log"
            "--http-proxy-temp-path=/tmp/nginx_proxy"
            "--http-scgi-temp-path=/tmp/nginx_scgi"
            "--http-uwsgi-temp-path=/tmp/nginx_uwsgi"
          ];
        });
      })
    ];
  };
in {
  extendingMakesDirs = [ "/" ];
  formatBash = {
    enable = true;
    targets = [ "/" ];
  };
  formatNix = {
    enable = true;
    targets = [ "/" ];
  };
  formatYaml = {
    enable = true;
    targets = [ "/" ];
  };
  lintBash = {
    enable = true;
    targets = [ "/" ];
  };
  lintGitCommitMsg = {
    branch = "main";
    enable = true;
    config = "/.lint-git-commit-msg/config.js";
    parser = "/.lint-git-commit-msg/parser.js";
  };
  lintNix = {
    enable = true;
    targets = [ "/" ];
  };
  formatJavaScript = {
    enable = true;
    targets = [ "/" ];
  };
  lintMarkdown = {
    all = {
      config = "/test/lint-markdown/config.rb";
      targets = [ "/" ];
    };
  };
  inputs = { inherit nixpkgs; };

}
