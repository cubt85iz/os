#!/usr/bin/env bash

set -ouex pipefail

EXTENSION_DIR="$HOME/.local/share/gnome-shell/extensions"
GNOME_SHELL_VERSION=$(gnome-shell --version | cut --delimeter=' ' --fields=3 | \
  cut --delimeter='.' --fields=1)

install_extension () {
  uuid=$1
  if [ -n "$uuid" ]; then
    extension_version=$(curl -Lfs "https://extensions.gnome.org/extension-query/?search=$uuid" | \
      jq --arg jq_build "$uuid" --arg jq_gnome_shell_version "$GNOME_SHELL_VERSION" \
      '.extensions[] | select(.uuid=$jq_build) | .shell_version_map | ."'"$GNOME_SHELL_VERSION"'".pk')
    if [ -n "$extension_version" ]; then
      curl "https://extensions.gnome.org/download-extension/$uuid.shell-extension.zip?version_tag=$extension_version" -o "$uuid.zip"
      if [ -d "$EXTENSION_DIR" ]; then
        mkdir "$EXTENSION_DIR/$uuid"
      fi

      unzip -o "$uuid.zip" -d "$EXTENSION_DIR/$uuid"
    fi
  fi
}

# Adds extension schema to gsettings
compile_extension_schema () {
  uuid=$1
  if [ -n "$uuid" ] && [ -d "$EXTENSION_DIR/$uuid" ]; then
    extension_xml_file=$EXTENSION_DIR/$uuid/schemas/*.xml
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

      # Change directory to glib_schemas_dir
      pushd "$glib_schemas_dir" || exit 1 &> /dev/null

      # Compile schemas.
      glib-compile-schemas .

      # Restore original directory
      popd || exit &> /dev/null

      return "$settings_schema"
    fi
  fi
}

# Accept variadic list of extensions to install.
extensions=( "$@" )
for extension in $extensions; do
  if install_extension "$extension"; then
    compile_extension_schema "$extension"
  fi
done
