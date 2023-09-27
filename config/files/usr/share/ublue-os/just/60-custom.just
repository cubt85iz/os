!include /usr/share/ublue-os/just/100-bling.just

# Compiles all GSettings XML schema files to gschemas.compiled
compile-gsettings-schemas:
  #!/usr/bin/env bash
  set -euxo pipefail

  # Change directory to schemas
  pushd "$HOME/.local/share/glib-2.0/schemas" || exit 1 &> /dev/null

  # Compile schemas.
  glib-compile-schemas .

  # Restore original directory
  popd || exit &> /dev/null

# Configures settings for desktop background
configure-desktop-background:
  gsettings set org.gnome.desktop.background color-shading-type 'solid'
  gsettings set org.gnome.desktop.background picture-options 'zoom'
  gsettings set org.gnome.desktop.background picture-uri 'file:///usr/share/backgrounds/gnome/adwaita-l.webp'
  gsettings set org.gnome.desktop.background picture-uri-dark 'file:///usr/share/backgrounds/gnome/adwaita-d.webp'
  gsettings set org.gnome.desktop.background primary-color '#3071AE'
  gsettings set org.gnome.desktop.background secondary-color '#000000'

# Configures settings for desktop interface
configure-desktop-interface:
  gsettings set org.gnome.desktop.interface clock-show-weekday 'true'
  gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
  gsettings set org.gnome.desktop.interface show-battery-percentage 'true'
  gsettings set org.gnome.desktop.interface toolkit-accessibility 'false'

# Configures settings for desktop notifications
configure-desktop-notifications:
  gsettings set org.gnome.desktop.notifications application-children "['org-gnome-software', 'org-gnome-terminal', 'org-gnome-extensions-desktop', 'org-gnome-evolution-alarm-notify', 'org-gnome-nautilus', 'code', 'gnome-power-panel', 'gnome-network-panel', 'firefox', 'gnome-printers-panel', 'com-spotify-client']"
  gsettings set org.gnome.desktop.notifications show-in-lock-screen 'false'

# Configure settings for GNOME extensions
configure-gnome-extensions:
  gsettings set org.gnome.shell.extensions.alphabetical-app-grid folder-order-position 'start'
  gsettings set org.gnome.shell.extensions.alphabetical-app-grid show-favourite-apps 'true'
  gsettings set org.gnome.shell.extensions.alphabetical-app-grid sort-folder-contents 'true'
  gsettings set org.gnome.shell.extensions.dash-to-dock apply-custom-theme 'true'
  gsettings set org.gnome.shell.extensions.dash-to-dock autohide 'true'
  gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'previews'
  gsettings set org.gnome.shell.extensions.dash-to-dock custom-background-color 'false'
  gsettings set org.gnome.shell.extensions.dash-to-dock dock-position 'BOTTOM'
  gsettings set org.gnome.shell.extensions.dash-to-dock intellihide 'true'
  gsettings set org.gnome.shell.extensions.dash-to-dock intellihide-mode 'FOCUS_APPLICATION_WINDOWS'
  gsettings set org.gnome.shell.extensions.dash-to-dock require-pressure-to-show 'true'
  gsettings set org.gnome.shell.extensions.dash-to-dock show-apps-at-top 'true'
  gsettings set org.gnome.shell.extensions.dash-to-dock show-favorites 'true'
  gsettings set org.gnome.shell.extensions.dash-to-dock show-mounts 'true'
  gsettings set org.gnome.shell.extensions.dash-to-dock show-show-apps-button 'true'
  gsettings set org.gnome.shell.extensions.Logo-menu menu-button-icon-image '1'
  gsettings set org.gnome.shell.extensions.openweather position-in-panel 'right'
  gsettings set org.gnome.shell.extensions.openweather pressure-unit 'bar'
  gsettings set org.gnome.shell.extensions.openweather unit 'fahrenheit'
  gsettings set org.gnome.shell.extensions.openweather wind-speed-unit 'mph'
  gsettings set org.gnome.shell.extensions.quick-settings-tweaks output-show-selected 'true'

# Configure settings for GNOME shell
configure-gnome-shell:
  gsettings set org.gnome.shell favorite-apps "['com.brave.Browser.desktop', 'org.mozilla.firefox.desktop', 'org.gnome.Terminal.desktop', 'org.gnome.Nautilus.desktop', 'code.desktop', 'com.spotify.Client.desktop', 'com.valvesoftware.Steam.desktop', 'com.discordapp.Discord.desktop']"
  gsettings set org.gnome.shell.app-switcher current-workspace-only 'true'
  gsettings set org.gnome.shell.weather automatic-location 'false'

# Configures keyboard bindings
configure-keybindings:
  gsettings set org.gnome.desktop.wm.keybindings show-desktop "['<Super>d']"
  gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugin/media-keys/custom-keybindings/custom0/', '/org/gnome/settings-daemon/plugin/media-keys/custom-keybindings/custom1/', '/org/gnome/settings-daemon/plugin/media-keys/custom-keybindings/custom2/']"
  gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybindings.custom0 binding '<Primary><Alt>t'
  gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybindings.custom0 command 'gnome-terminal'
  gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybindings.custom0 name 'Open Terminal'
  gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybindings.custom1 binding '<Super>e'
  gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybindings.custom1 command 'nautilus --new-window'
  gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybindings.custom1 name 'Open File Explorer'
  gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybindings.custom2 binding '<Shift><Control>Escape'
  gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybindings.custom2 command 'gnome-system-monitor'
  gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybindings.custom2 name 'Open System Monitor'

# Configures settings for Nautilus
configure-nautilus:
  gsettings set org.gnome.nautilus.preferences default-folder-view 'list-view'
  gsettings set org.gnome.nautilus.preferences migrated-gtk-settings 'true'
  gsettings set org.gnome.nautilus.preferences search-filter-time-type 'last_modified'
  gsettings set org.gnome.nautilus.preferences search-view 'list-view'
  gsettings set org.gtk.settings.file-chooser date-format 'regular'
  gsettings set org.gtk.settings.file-chooser location-mode 
  gsettings set org.gtk.settings.file-chooser show-hidden 
  gsettings set org.gtk.settings.file-chooser show-size-column 
  gsettings set org.gtk.settings.file-chooser show-type-column 
  gsettings set org.gtk.settings.file-chooser sidebar-width 
  gsettings set org.gtk.settings.file-chooser sort-column 
  gsettings set org.gtk.settings.file-chooser sort-directories-first 
  gsettings set org.gtk.settings.file-chooser sort-order 
  gsettings set org.gtk.settings.file-chooser type-format 

# Configures settings for power
configure-power-settings:
  gsettings set org.gnome.settings-daemon.plugins.power power-button-action 'interactive'
  gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-timeout '7200'
  gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type 'suspend'
  gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-timeout '900'

# Configures settings for privacy
configure-privacy-settings:
  gsettings set org.gnome.desktop.privacy disable-camera 'true'
  gsettings set org.gnome.desktop.privacy old-files-age 'uint32 30'
  gsettings set org.gnome.desktop.privacy recent-files-max-age '-1'
  gsettings set org.gnome.desktop.privacy remember-recent-files 'false'
  gsettings set org.gnome.system.location enabled 'false'

# Configures settings for touchpad
configure-touchpad:
  gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click 'true'
  gsettings set org.gnome.desktop.peripherals.touchpad two-finger-scrolling-enabled 'true'

# Configures settings for window manager
configure-windowmanager:
  gsettings set org.gnome.desktop.wm.preferences button-layout 'appmenu:minimize,maximize,close'

# Downloads and installs AppImages
install-appimages:
  mkdir -p ~/Apps
  curl https://mail.tutanota.com/desktop/tutanota-desktop-linux.AppImage -o ~/Apps/tutanota-desktop-linux.AppImage
  chmod u+x ~/Apps/tutanota-desktop-linux.AppImage

# Installs a specified GNOME extension
install-gnome-extension uuid:
  #!/usr/bin/env bash
  set -euxo pipefail

  EXTENSION_DIR="$HOME/.local/share/gnome-shell/extensions"
  GNOME_SHELL_VERSION=$(gnome-shell --version | cut --delimeter=' ' --fields=3 | \
    cut --delimeter='.' --fields=1)

  # Install extension
  extension_version=$(curl -Lfs "https://extensions.gnome.org/extension-query/?search={{ uuid }}" | \
    jq --arg jq_build "{{ uuid }}" --arg jq_gnome_shell_version "$GNOME_SHELL_VERSION" \
    '.extensions[] | select(.uuid=$jq_build) | .shell_version_map | ."'"$GNOME_SHELL_VERSION"'".pk')
  if [ -n "$extension_version" ]; then
    curl "https://extensions.gnome.org/download-extension/{{ uuid }}.shell-extension.zip?version_tag=$extension_version" -o "{{ uuid }}.zip"
    if [ -d "$EXTENSION_DIR" ]; then
      mkdir "$EXTENSION_DIR/{{ uuid }}"
    fi
    unzip -o "{{ uuid }}.zip" -d "$EXTENSION_DIR/$uuid"

    # Compile GSettings schemas 
    extension_xml_file=$EXTENSION_DIR/{{ uuid }}/schemas/*.xml
    if [ -n "$extension_xml_file" ]; then
      # Get schema for extension from metadata.json
      settings_schema=$(jq -r '."settings-schema"' "$dir/metadata.json")

      # If necessary, create schemas directory for glib-2.0.
      glib_schemas_dir="$HOME/.local/share/glib-2.0/schemas"
      if [ ! -d "$glib_schemas_dir" ]; then
        mkdir -p "$glib_schemas_dir"
      fi

      # Copy extension_xml_file to glib_schemas_dir
      cp "$extension_xml_file" "$glib_schemas_dir"

      # Enable extension
      gnome-extensions enable {{ uuid }}
    fi
  fi

# Installs all GNOME extensions
install-gnome-extensions:
  just install-gnome-extension add-username-toppanel@brendaw.com
  just install-gnome-extension AlphabeticalAppGrid@stuarthayhurst
  just install-gnome-extension appindicatorsupport@rgcjonas.gmail.com
  just install-gnome-extension blur-my-shell@aunetx
  just install-gnome-extension dash-to-dock@micxgx.gmail.com
  just install-gnome-extension dynamic-panel-transparency@rockon999.github.io
  just install-gnome-extension gsconnect@andyholmes.github.io
  just install-gnome-extension logomenu@aryan_k
  just install-gnome-extension Move_Clock@rmy.pobox.com
  just install-gnome-extension no-overview@fthx
  just install-gnome-extension openweather-extension@jenslody.de
  just install-gnome-extension quick-settings-tweaks@qwreey
  just compile-gsettings-schemas
  just configure-gnome-extensions

# Sets up PC with desired settings
setup:
  just configure-desktop-background
  just configure-desktop-interface
  just configure-desktop-notifications
  just configure-keybindings
  just configure-nautilus
  just configure-power-settings
  just configure-privacy-settings
  just configure-touchpad
  just configure-windowmanager
  just install-appimages
  just install-gnome-extensions
