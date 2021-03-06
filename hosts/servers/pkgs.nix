{lib, config, pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    git
    htop
    vim
    wireguard
    vault
  ];
  programs = {
    zsh = {
      enable = true;
      promptInit = "PROMPT='%B%F{cyan}%~ %F{blue}>%f%b '\nRPROMPT='%B%F{cyan}%n%f@%F{red}%m%b'";
      histSize = 12000;
      enableCompletion = true;
      syntaxHighlighting.enable = true;
      autosuggestions. enable = true;
      ohMyZsh.enable = true;
    };
    gnupg = {
      agent = {
        enable = true;
        pinentryFlavor = "curses";
      };
    };
  };
  nix = {
    package = pkgs.nixUnstable;
    extraOptions = ''
      experimental-features = nix-command ca-references flakes
    '';
    trustedUsers = [ "root" ];
  };
}
