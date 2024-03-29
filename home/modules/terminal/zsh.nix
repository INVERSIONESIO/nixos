{pkgs, ...}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    completionInit = builtins.readFile ./dots/completionInit.zsh;

    history = {
      expireDuplicatesFirst = true;
      ignoreSpace = true;
      save = 10000 * 2;
    };

    plugins = with pkgs; [
      {
        name = "nix-shell";
        file = "nix-shell.plugin.zsh";
        src = fetchFromGitHub {
          owner = "chisui";
          repo = "zsh-nix-shell";
          rev = "227d284ab2dc2f5153826974e0094a1990b1b5b9";
          sha256 = "11mkq58ssafvkq8sq27v0dl19mi2myi392nhxgi1q2q9q0gazcaa";
        };
      }
      {
        name = "you-should-use";
        file = "you-should-use.plugin.zsh";
        src = fetchFromGitHub {
          owner = "MichaelAquilina";
          repo = "zsh-you-should-use";
          rev = "5b316f4af3ac90e044f386003aacdaa0ad606488";
          sha256 = "192jb680f1sc5xpgzgccncsb98xa414aysprl52a0bsmd1slnyxs";
        };
      }
      {
        name = "extract";
        file = "extract.sh";
        src = fetchFromGitHub {
          owner = "xvoland";
          repo = "Extract";
          rev = "439e92c5b355b40c36d8a445636d0e761ec08217";
          sha256 = "1yaphcdnpxcdrlwidw47waix8kmv2lb5a9ccmf8dynlwvhyvh1wi";
        };
      }
      {
        name = "zsh-better-npm-completion";
        file = "zsh-better-npm-completion.plugin.zsh";
        src = fetchFromGitHub {
          owner = "lukechilds";
          repo = "zsh-better-npm-completion";
          rev = "47e5987ca422de43784f9d76311d764f82af2717";
          sha256 = "0n9pd29rr7y6k5v4rzhpd94nsixsscdmhgvwisvbfz843pfikr5f";
        };
      }
    ];
  };
}
