{lib, config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    bc
    gnumake
    pciutils
    git
    ntfs3g
    python3
    htop
    nodejs
    wineWowPackages.staging
    wget
    ripgrep
    kbd
    cachix
    gcc
    rustc
    jdk
    virtmanager
  ];

  programs = {
    steam.enable = true;
    gnupg = {
      agent = {
        enableSSHSupport = true;
        enable = true;
        pinentryFlavor = "curses";
      };
    };
    zsh = {
      enable = true;
      promptInit = ''
      RPROMPT='%B%F{cyan}%n%f@%F{red}%m%b'
      function preexec() {
        timer=$(date +%s%3N)
      }
      function precmd() {
      if [ $timer ]; then
        now=$(date +%s%3N)
        elapsed=$(($now-$timer))
        unset timer
        unit="ms"
        if [ $elapsed -gt 1000 ]; then
          elapsed=$(echo "scale=1; $elapsed/1000" | ${pkgs.bc}/bin/bc -l)
          unit="s"
        fi
        if (($(echo "$elapsed > 60" | bc -l ))); then
          elapsed=$(echo "scale=2; $elapsed/60" | ${pkgs.bc}/bin/bc -l)
          unit="m"
        fi
        RPROMPT='%B%F{cyan}%n%f@%F{red}%m %F{yellow}~%f %F{magenta}$elapsed $unit%f%b '
      fi
      }
      '';
      histSize = 12000;
      enableCompletion = true;
      enableBashCompletion = true;
      syntaxHighlighting.enable = true;
      autosuggestions = {
        enable = true;
        highlightStyle = "fg=yellow,bold";
      };
      ohMyZsh = {
        enable = true;
        theme = "awesomepanda";
      };
    };
    dconf.enable = true;
    adb.enable = true;
    light.enable = true;
  };
  nix = {
    package = pkgs.nixUnstable;
    extraOptions = ''
      experimental-features = nix-command ca-references flakes
    '';
    trustedUsers = [ "root" "natto" ];
 #   binaryCaches = ["http://152.67.11.101/" "https://cache.nixos.org/"];
 #   binaryCachePublicKeys = ["152.67.11.101:lbEG3jz8pB5IxxjCQcZwS1a85XK5HIYN7g2E9Zw0r1M="];
  };
}
