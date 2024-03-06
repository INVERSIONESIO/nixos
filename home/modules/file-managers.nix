{ ...}: {
  home.packages = [
    (
      super.ranger.overrideAttrs (
        old: {
          preConfigure =
            old.preConfigure
            + ''
              substituteInPlace ranger/ext/img_display.py \
                --replace "Popen(['ueberzug'" \
                          "Popen(['${self.ueberzugpp}/bin/ueberzugpp'"

              substituteInPlace ranger/config/rc.conf \
                --replace 'set preview_images_method w3m' \
                          'set preview_images_method ueberzug'
            '';
        }
      )
    )
    xfce.thunar
  ];
}
