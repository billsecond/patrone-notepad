#!/bin/bash
# Runs the installed Flatpak in its sandbox (.github/workflows/flatpak.yml).
set -euo pipefail
id=org.patrone.Notepad
dbus-run-session -- flatpak run "$id" --help
# PatroneOS's fonts are in it
[[ $(flatpak run --command=fc-list "$id" | grep -c PatroneOS) -gt 0 ]]
# Its licences, for About, and its listing
flatpak run --command=ls "$id" /app/share/doc/patrone-notepad/third-party-licenses.txt.gz \
    /app/share/metainfo/org.patrone.Notepad.metainfo.xml
echo "The Flatpak runs, with its fonts and licences."
