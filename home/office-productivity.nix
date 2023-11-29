{ pkgs
, ...
}: {
  home.packages = with pkgs; [

    libreoffice-qt # TODO or libreoffice?
    hunspell
    hunspellDicts.en_US
    hunspellDicts.fr-reforme1990
  ];
}
