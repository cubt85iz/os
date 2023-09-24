!include /usr/share/ublue-os/just/bling.just

# Include some of your custom scripts here!
enable-hwaccel-playback-firefox:
  flatpak override \
    --user \
    --filesystem=host-os \
    --env=LIBVA_DRIVER_NAME=nvidia \
    --env=LIBVA_DRIVERS_PATH=/run/host/usr/lib64/dri \
    --env=LIBVA_MESSAGING_LEVEL=1 \
    --env=MOZ_DISABLE_RDD_SANDBOX=1 \
    --env=NVD_BACKEND=direct \
    --env=MOZ_ENABLE_WAYLAND=1 \
    org.mozilla.firefox

install-appimages:
  mkdir -p ~/Apps
  curl https://mail.tutanota.com/desktop/tutanota-desktop-linux.AppImage -o ~/Apps/tutanota-desktop-linux.AppImage

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

set-nvidia-kargs:
  rpm-ostree kargs \
    --append=rd.driver.blacklist=nouveau \
    --append=modprobe.blacklist=nouveau \
    --append=nvidia-drm.modeset=1

enroll-secure-boot-key:
  sudo mokutil --import /etc/pki/akmods/certs/akmods-ublue.der