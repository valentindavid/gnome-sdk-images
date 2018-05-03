#!/bin/bash

STATEDIR=$1

make org.gnome.Sdk.json
flatpak-builder --download-only --no-shallow-clone --allow-missing-runtimes --state-dir=$STATEDIR $STATEDIR/.builddir org.gnome.Sdk.json
