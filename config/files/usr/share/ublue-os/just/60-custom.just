!include /usr/share/ublue-os/just/100-bling.just

# Include some of your custom scripts here!
install-appimages:
  mkdir -p ~/Apps
  curl https://mail.tutanota.com/desktop/tutanota-desktop-linux.AppImage -o ~/Apps/tutanota-desktop-linux.AppImage
  chmod u+x ~/Apps/tutanota-desktop-linux.AppImage

install-gnome-extensions:
  pip install --upgrade gnome-extensions-cli
  gext install add-username-toppanel@brendaw.com
  gext install AlphabeticalAppGrid@stuarthayhurst
  gext install appindicatorsupport@rgcjonas.gmail.com
  gext install dash-to-dock@micxgx.gmail.com
  gext install dynamic-panel-transparency@rockon999.github.io
  gext install gsconnect@andyholmes.github.io
  gext install logomenu@aryan_k
  gext install Move_Clock@rmy.pobox.com
  gext install no-overview@fthx
  gext install openweather-extension@jenslody.de
  gext install quick-settings-tweaks@qwreey
